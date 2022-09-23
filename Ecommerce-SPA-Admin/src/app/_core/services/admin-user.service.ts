import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment';
import { EmployeeParam } from '../params/employeeParam';
import { Pagination, PaginationResult } from '@utilities/pagination-utility';
import { OperationResult } from '@utilities/operation-result';
import { AdminUser } from '@models/adminUser';
import { UserAuthorize } from '@models/employee/userAuthorizeDto';

@Injectable({ providedIn: 'root' })
export class AdminUserService {
  apiUrl: string = environment.apiUrl;
  constructor(private http: HttpClient) { }

  getUsers(param: EmployeeParam, pagination: Pagination): Observable<PaginationResult<AdminUser>> {
    const params = new HttpParams().appendAll({ ...param, ...pagination });
    return this.http.get<PaginationResult<AdminUser>>(this.apiUrl + 'AdminUser/All', { params });
  }

  getUser(userAccount: string): Observable<AdminUser> {
    const params = new HttpParams().appendAll({ userAccount });
    return this.http.get<AdminUser>(this.apiUrl + 'AdminUser', { params });
  }

  getUserRoles(userAccount: string): Observable<UserAuthorize[]> {
    const params = new HttpParams().appendAll({ userAccount });
    return this.http.get<UserAuthorize[]>(this.apiUrl + 'AdminUser/UserRoles', { params });
  }

  updateUserRoles(roles: UserAuthorize[], userAccount: string): Observable<OperationResult> {
    return this.http.post<OperationResult>(this.apiUrl + 'AdminUser/UserRoles', roles, { params: { userAccount } });
  }

  addUser(userDto: AdminUser): Observable<OperationResult> {
    return this.http.post<OperationResult>(this.apiUrl + 'AdminUser', userDto);
  }

  editUser(userDto: AdminUser): Observable<OperationResult> {
    return this.http.put<OperationResult>(this.apiUrl + 'AdminUser', userDto);
  }

  delete(userAccount: string): Observable<OperationResult> {
    const params = new HttpParams().appendAll({ userAccount });
    return this.http.delete<OperationResult>(this.apiUrl + 'AdminUser', { params });
  }
}