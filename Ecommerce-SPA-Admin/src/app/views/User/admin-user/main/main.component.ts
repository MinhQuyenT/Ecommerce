import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IconButton } from '@constants/common.constant';
import { AdminUser } from '@models/adminUser';
import { TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { AdminUserService } from '@services/admin-user.service';
import { Pagination, PaginationResult } from '@utilities/pagination-utility';
import { firstValueFrom, of } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';
import { EmployeeParam } from 'src/app/_core/params/employeeParam';
import { NgxSpinnerService } from 'ngx-spinner';
import { UserForLogged } from '@models/auth/userForLogged';
import { LocalStorageConstant } from '@constants/local-storage.constant';
import { FunctionUtility } from '@utilities/fucntion-utility';
import { createMap } from '@automapper/core';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.scss']
})
export class MainComponent implements OnInit {
  pagination: Pagination = <Pagination>{};
  users: AdminUser[] = [];
  param: EmployeeParam = <EmployeeParam>{};
  iconButton: typeof IconButton = IconButton;

  constructor(
    private userAdminService: AdminUserService,
    private snotifyService: NgSnotifyService,
    private translateService: TranslateService,
    private route: ActivatedRoute,
    private router: Router,
    private spinnerService: NgxSpinnerService,
    private functionUtility: FunctionUtility) { 
      // createMap(mapper,AdminUser,AdminUserDto)
    }

  ngOnInit(): void {
    const res: PaginationResult<AdminUser> = this.route.snapshot.data.res;
    this.pagination = res.pagination;
    this.users = res.result;
  }

  async getData(): Promise<void> {
    await this.userAdminService.getUsers(this.param, this.pagination)
      .pipe(
        tap(res => {
          this.users = res.result;
          this.pagination = res.pagination;
        }),
        catchError(() => {
          this.snotifyService.error(
            this.translateService.instant('System.Message.SystemError'),
            this.translateService.instant('System.Caption.Error'));
          return of(null);
        }))
      .toPromise();
  }

  addNew(): void {
    this.router.navigate(['/user/admin-user/add']);
  }

  edit(userAccount: string): void {
    this.router.navigate(['/user/admin-user/edit', userAccount]);
  }

  authorize(userAccount: string): void {
    this.router.navigate(['/user/admin-user/authorize', userAccount]);
  }

  delete(userAccount: string) {
    const currentUser: UserForLogged = JSON.parse(localStorage.getItem(LocalStorageConstant.USER));
    if (!currentUser || userAccount === currentUser.userAccount)
      return this.snotifyService.error(
        this.translateService.instant('System.Message.DeleteErrorMsg'),
        this.translateService.instant('System.Caption.Error'));

    this.snotifyService.confirm(
      this.translateService.instant('System.Message.ConfirmDelete'),
      this.translateService.instant('System.Caption.Confirm'),
      async () => {
        this.spinnerService.show();
        await firstValueFrom(
          this.userAdminService.delete(userAccount).pipe(
            tap(async res => {
              this.spinnerService.hide();
              if (res.isSuccess) {
                this.snotifyService.success(
                  this.translateService.instant('System.Message.DeleteOKMsg'),
                  this.translateService.instant('System.Caption.Success'));
                this.functionUtility.calculatePagination(this.pagination);
                await this.getData();
              } else {
                this.snotifyService.error(
                  this.translateService.instant('System.Message.DeleteErrorMsg'),
                  this.translateService.instant('System.Caption.Error'));
              }
            }),
            catchError(() => {
              this.spinnerService.hide();
              this.snotifyService.error(
                this.translateService.instant('System.Message.SystemError'),
                this.translateService.instant('System.Caption.Error'));
              return of(null);
            })
          ))
      }
    )
  }

  async pageChanged(event: any) {
    this.pagination.pageNumber = event;
    await this.getData();
  }
}
