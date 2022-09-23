import { Injectable } from '@angular/core';
import { Resolve, ActivatedRouteSnapshot } from '@angular/router';
import { UserAuthorize } from '@models/employee/userAuthorizeDto';
import { AdminUserService } from '@services/admin-user.service';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class AdminUserAuthorizeResolver implements Resolve<UserAuthorize[]> {
  constructor(private userAdminService: AdminUserService) { }

  resolve(route: ActivatedRouteSnapshot): Observable<UserAuthorize[]> {
    const userAccount: string = route.params['userAccount'];
    return this.userAdminService.getUserRoles(userAccount);
  }
}