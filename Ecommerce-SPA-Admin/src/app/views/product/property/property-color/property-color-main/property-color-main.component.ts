import { Component, HostListener, OnInit, TemplateRef } from '@angular/core';
import { IconButton } from '@constants/common.constant';
import { LangConstant } from '@constants/lang.constant';
import { Color } from '@models/color';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { LangChangeEvent, TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { PropertyColorService } from '@services/properties/property-color.service';
import { Pagination } from '@utilities/pagination-utility';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-property-color-main',
  templateUrl: './property-color-main.component.html',
  styleUrls: ['./property-color-main.component.scss']
})

export class PropertyColorMainComponent implements OnInit {
  lang: string = LangConstant.VN;
  iconButton = IconButton;
  pagination: Pagination = {
    pageNumber: 1,
    pageSize: 10,
  } as Pagination
  data: Color[];
  color?: Color;

  constructor(private spinner: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translate: TranslateService,
    private service: PropertyColorService,
    private modalService: NgbModal) { }

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

  openModal(modelRef: TemplateRef<any>, color?: Color) {
    this.color = color;
    this.modalService.open(modelRef, { centered: true });
  }

  addColor(newItem: Color) {
    // this.data.push(newItem);
    this.getAll('');
  }

  onClose(): void {
    this.modalService.dismissAll();
  }
  delete(color: Color) {
    this.snotifyService.confirm(this.translate.instant('System.Message.ConfirmDeleteMsg'), this.translate.instant('System.Action.Delete'),
      () => {
        this.spinner.show();
        this.service.delete(color.id).subscribe({
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