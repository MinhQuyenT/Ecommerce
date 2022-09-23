import { environment } from "@environments/environment";
import { JwtHelperService } from "@auth0/angular-jwt";
import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";
import { NgSnotifyService } from "./ng-snotify.service";
import { Router } from "@angular/router";
import { UserForLoginParam } from "@params/userForLoginParam";
import { UserForLogged } from "@models/auth/userForLogged";
import { map, tap } from "rxjs/operators";
import { LocalStorageConstant } from "@constants/local-storage.constant";
import { TokenRequestParam } from "@params/tokenRequestParam";
import { of } from "rxjs";
import { TranslateService } from "@ngx-translate/core";
import { UserReturned } from "@models/auth/userReturned";


@Injectable({
  providedIn: 'root',
})
export class AdminAuthService {
  refreshTokenTimeout: NodeJS.Timeout;
  baseUrl = environment.apiUrl + 'AdminAuth/';
  jwtHelper = new JwtHelperService();
  currentUser: UserForLogged;
  decodedToken: any;

  constructor(
    private http: HttpClient,
    private snotifyService: NgSnotifyService,
    private translateService: TranslateService,
    private router: Router) { }

  login(model: UserForLoginParam) {
    return this.http.post<UserReturned>(this.baseUrl + 'Login', model).pipe(
      tap(res => {
        if (res) {
          if (model.remember_Me) {
            localStorage.setItem(LocalStorageConstant.REFRESH_TOKEN, res.refreshToken);
          }
          localStorage.setItem(LocalStorageConstant.TOKEN, res.token);
          localStorage.setItem(LocalStorageConstant.USER, JSON.stringify(res.user));
          this.decodedToken = this.jwtHelper.decodeToken(res.token);
          this.currentUser = res.user;
          this.startRefreshTokenTimer();
        }
      }),
    );
  }

  refreshToken() {
    let tokenRequest: TokenRequestParam = { token: localStorage.getItem(LocalStorageConstant.REFRESH_TOKEN) }

    if (tokenRequest.token) {
      return this.http.post<UserReturned>(`${this.baseUrl}RefreshToken`, tokenRequest)
        .pipe(
          map((res) => {
            localStorage.setItem(LocalStorageConstant.TOKEN, res.token);
            localStorage.setItem(LocalStorageConstant.USER, JSON.stringify(res.user));
            localStorage.setItem(LocalStorageConstant.REFRESH_TOKEN, res.refreshToken);
            this.decodedToken = this.jwtHelper.decodeToken(res.token);
            this.currentUser = res.user;
            this.startRefreshTokenTimer();
            return res;
          }));
    } else {
      return of(null);
    }
  }

  logout() {
    let tokenRequest: TokenRequestParam = { token: localStorage.getItem(LocalStorageConstant.REFRESH_TOKEN) }
    this.http.post<any>(`${this.baseUrl}RevokeToken`, tokenRequest).subscribe();
    localStorage.removeItem(LocalStorageConstant.TOKEN);
    localStorage.removeItem(LocalStorageConstant.REFRESH_TOKEN);
    localStorage.removeItem(LocalStorageConstant.USER);
    this.stopRefreshTokenTimer();
    this.decodedToken = null;
    this.snotifyService.success(
      this.translateService.instant('System.Message.Logout'),
      this.translateService.instant('System.Caption.Success'));
    this.router.navigate(['/login']);
  }

  loggedIn() {
    const token: string = localStorage.getItem(LocalStorageConstant.TOKEN);
    const curentUser: UserForLogged = JSON.parse(localStorage.getItem(LocalStorageConstant.USER));
    if (!curentUser || !curentUser.roles) {
      return false;
    }
    return !this.jwtHelper.isTokenExpired(token);
  }

  private startRefreshTokenTimer() {
    // Gán timeout để làm mới token trước 1 phút nó hết hạn
    const expires = new Date(this.decodedToken.exp * 1000);
    const timeout = expires.getTime() - Date.now() - (60 * 1000);
    this.refreshTokenTimeout = setTimeout(() => this.refreshToken().subscribe(), timeout);
  }

  private stopRefreshTokenTimer() {
    clearTimeout(this.refreshTokenTimeout);
  }
}
