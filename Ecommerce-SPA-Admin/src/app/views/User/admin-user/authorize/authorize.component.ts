import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { UserAuthorize } from '@models/employee/userAuthorizeDto';
import { TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { AdminUserService } from '@services/admin-user.service';
import { NgxSpinnerService } from 'ngx-spinner';
import { TreeviewConfig, TreeviewItem } from 'ngx-treeview';
import { IconButton } from '@constants/common.constant';
import { catchError, takeUntil, tap } from 'rxjs/operators';
import { of } from 'rxjs';
import { DestroyService } from '@services/destroy.service';

@Component({
  selector: 'app-authorize',
  templateUrl: './authorize.component.html',
  styleUrls: ['./authorize.component.scss']
})
export class AuthorizeComponent implements OnInit {
  userAuth: UserAuthorize[] = [];
  config: TreeviewConfig = <TreeviewConfig>{
    hasAllCheckBox: true,
    hasCollapseExpand: true,
    decoupleChildFromParent: false,
    hasDivider: true
  };
  items: TreeviewItem[] = [];
  iconButton: typeof IconButton = IconButton;
  userAccount: string = '';

  constructor(
    private spinnerService: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translateService: TranslateService,
    private userAdminService: AdminUserService,
    private router: Router,
    private route: ActivatedRoute,
    private destroyService: DestroyService
  ) { }

  ngOnInit(): void {
    this.initPage();
    this.translateService.onLangChange.pipe(takeUntil(this.destroyService.destroys$)).subscribe(e => {
      this.mapRoles();
    })
  }

  initPage() {
    const userAuth: UserAuthorize[] = this.route.snapshot.data.res;
    this.userAuth = [...userAuth];
    this.userAccount = this.route.snapshot.params['userAccount'];
    this.mapRoles();
  }

  mapRoles() {
    this.items = this.userAuth
      .map(x => new TreeviewItem({
        text: this.translateService.instant(x.roleName),
        value: x.roleUnique,
        checked: x.status,
        children: [...
          x.children?.map(y => new TreeviewItem({
            text: this.translateService.instant(y.roleName),
            value: y.roleUnique,
            checked: y.status,
            children: [...
              y.children?.map(z => new TreeviewItem({
                text: this.translateService.instant(z.roleName),
                value: z.roleUnique,
                checked: z.status,
              }))]
          }))]
      }));
  }

  async save() {
    this.spinnerService.show();
    const roles = this.items?.map((x: any) => <UserAuthorize>{
      status: x.internalChecked === undefined || x.internalChecked,
      roleUnique: x.value,
      roleName: 'null', roleNote: 'null', roleType: 'null', updateBy: 'null',
      children: x.children?.map((y: any) => <UserAuthorize>{
        status: y.internalChecked === undefined || y.internalChecked,
        roleUnique: y.value,
        roleName: 'null', roleNote: 'null', roleType: 'null', updateBy: 'null',
        children: y.children?.map((z: any) => <UserAuthorize>{
          status: z.internalChecked === undefined || z.internalChecked,
          roleUnique: z.value,
          roleName: 'null', roleNote: 'null', roleType: 'null', updateBy: 'null',
        })
      })
    });
    await this.userAdminService.updateUserRoles(roles, this.userAccount)
      .pipe(
        tap(res => {
          this.spinnerService.hide();
          if (res.isSuccess) {
            this.snotifyService.success(
              this.translateService.instant('System.Message.UpdateOKMsg'),
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

  reset() {
    this.mapRoles();
  }

  back() {
    this.router.navigate(['/user/admin-user']);
  }
}
