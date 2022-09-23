import { Component, OnInit, TemplateRef } from '@angular/core';
import { IconButton } from '@constants/common.constant';
import { LangConstant } from '@constants/lang.constant';
import { Size } from '@models/size';
import { LangChangeEvent, TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { PropertySizeService } from '@services/properties/property-size.service';
import { Pagination } from '@utilities/pagination-utility';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-property-size-main',
  templateUrl: './property-size-main.component.html',
  styleUrls: ['./property-size-main.component.scss'],
})
export class PropertySizeMainComponent implements OnInit {
  lang: string = LangConstant.VN;
  iconButton = IconButton;
  pagination: Pagination = {
    pageNumber: 1,
    pagesize: 10,
  } as unknown as Pagination
  data: Size[];

  constructor(private spinner: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translate: TranslateService,
    private service: PropertySizeService) { }

  ngOnInit() {
    this.getAll('');
    this.translate.onLangChange.subscribe(res => {
      this.lang = res.lang;
    })
  }

  search(event: Event) {
    let searchKey = (event.target as HTMLInputElement).value ?? '';
    this.pagination.pageNumber == 1 ? this.getAll(searchKey) : this.pagination.pageNumber = 1;
  }

  getAll(searchKey?: string) {
    this.spinner.show();
    this.service.getAll(this.pagination, searchKey).subscribe({
      next: (res) => {
        this.data = res.result;
        this.pagination = res.pagination;
      },
      error: (e) => {
        this.snotifyService.error(
          this.translate.instant('System.Message.UnknowError'),
          this.translate.instant('System.Caption.Error'))
      }
    }).add(() => this.spinner.hide())
  }

  delete(size: Size) {
    this.snotifyService.confirm(this.translate.instant('System.Message.ConfirmDeleteMsg'), this.translate.instant('System.Action.Delete'),
      () => {
        this.spinner.show();
        this.service.delete(size.id).subscribe({
          next: (res) => {
            if (res) {
              this.snotifyService.success(this.translate.instant('System.Message.DeleteOKMsg'), this.translate.instant('System.Caption.Success'));
              this.getAll('');
            }
            else {
              this.snotifyService.success(this.translate.instant('System.Message.DeleteErrorMsg'), this.translate.instant('System.Caption.Success'));
            }
          },
          error: () => {
            this.snotifyService.error(
              this.translate.instant('System.Message.UnknowError'),
              this.translate.instant('System.Caption.Error'));
          }
        }).add(() => this.spinner.hide())
      });
  }

  pageChanged(event: any) {
    this.pagination.pageNumber = event;
    this.getAll('');
  }
}
