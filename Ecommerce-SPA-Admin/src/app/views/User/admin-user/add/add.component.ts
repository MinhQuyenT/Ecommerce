import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { IconButton } from '@constants/common.constant';
import { AdminUser } from '@models/adminUser';
import { NgbDateNativeAdapter } from '@ng-bootstrap/ng-bootstrap';
import { TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { AdminUserService } from '@services/admin-user.service';
import { NgxSpinnerService } from 'ngx-spinner';
import { of } from 'rxjs';
import { catchError, tap } from 'rxjs/operators';

@Component({
  selector: 'app-add',
  templateUrl: './add.component.html',
  styleUrls: ['./add.component.scss'],
  providers: [{ provide: NgbDateNativeAdapter, useClass: NgbDateNativeAdapter }]
})
export class AddComponent implements OnInit {
  employee: AdminUser = <AdminUser>{};
  iconButton: typeof IconButton = IconButton;

  constructor(
    private spinnerService: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translateService: TranslateService,
    private userAdminService: AdminUserService,
    private router: Router,
    private dateAdapter: NgbDateNativeAdapter) { }

  ngOnInit(): void {
  }

  async save() {
    this.spinnerService.show();
    const userDto: AdminUser = { ...this.employee };
    userDto.validFrom = this.dateAdapter.toModel(userDto.validFrom).toUTCDate();
    userDto.validTo = this.dateAdapter.toModel(userDto.validTo).toUTCDate();
    await this.userAdminService.addUser(userDto)
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
}
