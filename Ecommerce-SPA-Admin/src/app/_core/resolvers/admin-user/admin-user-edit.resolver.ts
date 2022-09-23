import { Injectable } from '@angular/core';
import { Resolve, ActivatedRouteSnapshot } from '@angular/router';
import { AdminUser } from '@models/adminUser';
import { AdminUserService } from '@services/admin-user.service';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class AdminUserEditResolver implements Resolve<AdminUser> {
  constructor(private userAdminService: AdminUserService) { }

  resolve(route: ActivatedRouteSnapshot): Observable<AdminUser> | Promise<AdminUser> | AdminUser {
    const userAccount: string = route.params['userAccount'];
    return this.userAdminService.getUser(userAccount);
  }
}