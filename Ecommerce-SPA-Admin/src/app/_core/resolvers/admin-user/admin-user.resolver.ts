import { Injectable } from '@angular/core';
import { Resolve, ActivatedRouteSnapshot } from '@angular/router';
import { AdminUser } from '@models/adminUser';
import { EmployeeParam } from '@params/employeeParam';
import { AdminUserService } from '@services/admin-user.service';
import { Pagination, PaginationResult } from '@utilities/pagination-utility';
import { Observable } from 'rxjs';

@Injectable({ providedIn: 'root' })
export class AdminUserResolver implements Resolve<PaginationResult<AdminUser>> {
  pagination: Pagination = <Pagination>{
    pageNumber: 1,
    pageSize: 10
  };
  param: EmployeeParam = <EmployeeParam>{};

  constructor(private userAdminService: AdminUserService) { }

  resolve(route: ActivatedRouteSnapshot): Observable<PaginationResult<AdminUser>> | Promise<PaginationResult<AdminUser>> | PaginationResult<AdminUser> {
    return this.userAdminService.getUsers(this.param, this.pagination);
  }
}