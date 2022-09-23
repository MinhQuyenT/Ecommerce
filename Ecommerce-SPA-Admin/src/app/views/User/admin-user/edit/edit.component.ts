import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IconButton } from '@constants/common.constant';
import { AdminUser } from '@models/adminUser';
import { NgbDateNativeAdapter } from '@ng-bootstrap/ng-bootstrap';
import { TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { AdminUserService } from '@services/admin-user.service';
import { NgxSpinnerService } from 'ngx-spinner';
import { of } from 'rxjs';
import { tap, catchError } from 'rxjs/operators';

@Component({
  selector: 'app-edit',
  templateUrl: './edit.component.html',
  styleUrls: ['./edit.component.scss'],
  providers: [{ provide: NgbDateNativeAdapter, useClass: NgbDateNativeAdapter }]
})
export class EditComponent implements OnInit {
  employee: AdminUser = <AdminUser>{};
  employeeBackup: AdminUser = <AdminUser>{};
  iconButton: typeof IconButton = IconButton;

  constructor(
    private spinnerService: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translateService: TranslateService,
    private userAdminService: AdminUserService,
    private router: Router,
    private route: ActivatedRoute,
    private dateAdapter: NgbDateNativeAdapter) { }

  ngOnInit(): void {
    this.initPage();
  }

  initPage() {
    const empDto: AdminUser = this.route.snapshot.data.res;
    empDto.validFrom = this.dateAdapter.fromModel(empDto.validFrom.toDate());
    empDto.validTo = this.dateAdapter.fromModel(empDto.validTo.toDate());
    this.employee = { ...empDto };
    this.employeeBackup = { ...empDto };
  }

  async save() {
    this.spinnerService.show();
    const empDto: AdminUser = { ...this.employee };
    empDto.validFrom = this.dateAdapter.toModel(empDto.validFrom).toUTCDate();
    empDto.validTo = this.dateAdapter.toModel(empDto.validTo).toUTCDate();
    await this.userAdminService.editUser(empDto)
      .pipe(
        tap(res => {
          this.spinnerService.hide();
          if (res.isSuccess) {
            this.snotifyService.success(
              this.translateService.instant('System.Message.CreateOKMsg'),
              this.translateService.instant('System.Caption.Success'));
            this.back();
          }
        }),
        catchError(() => {
          this.snotifyService.error(
            this.translateService.instant('System.Message.UnknowError'),
            this.translateService.instant('System.Caption.Error'));
          return of(null);
        }))
      .toPromise();
  }

  back() {
    this.router.navigate(['/user/admin-user']);
  }

  reset() {
    this.employee = { ...this.employeeBackup };
  }
}
