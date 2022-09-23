import { Component, OnInit } from '@angular/core';
import { OwlOptions } from 'ngx-owl-carousel-o';
import { Router } from '@angular/router';
import { UserForLoginParam } from '@params/userForLoginParam';
import { AdminAuthService } from '@services/admin-auth.service';
import { NgxSpinnerService } from 'ngx-spinner';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { catchError, firstValueFrom, of, tap } from 'rxjs';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
/**
 * Login-2 component
 */
export class LoginComponent implements OnInit {
  userForLoginParam: UserForLoginParam = <UserForLoginParam>{};
  showPassword: boolean = false;
  carouselOption: OwlOptions = {
    items: 1,
    loop: false,
    margin: 0,
    nav: false,
    dots: true,
    responsive: {
      680: {
        items: 1
      },
    }
  };
  year: number = new Date().getFullYear();

  constructor(
    private adminAuthService: AdminAuthService,
    private spinnerService: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private router: Router,
    private translateService: TranslateService) { }

  ngOnInit(): void {
    document.body.classList.add('auth-body-bg')
    if (this.adminAuthService.loggedIn()) {
      this.router.navigate(['/dashboard']);
    }
  }

  toggleShowPassword() {
    this.showPassword = !this.showPassword;
  }

  async onSubmit() {
    this.spinnerService.show();
    await firstValueFrom(this.adminAuthService.login(this.userForLoginParam)
      .pipe(
        tap(() => {
          this.spinnerService.hide();
          this.snotifyService.success(
            this.translateService.instant('System.Message.LogIn'),
            this.translateService.instant('System.Caption.Success'));
          this.router.navigate(['/dashboard']);
        }),
        catchError(() => {
          this.spinnerService.hide();
          this.snotifyService.error(
            this.translateService.instant('System.Message.LogInFailed'),
            this.translateService.instant('System.Caption.Error'));
          return of(null);
        })
      ));
  }
}
