import { Component, OnInit, TemplateRef } from '@angular/core';
import { IconButton } from '@constants/common.constant';
import { LangConstant } from '@constants/lang.constant';
import { Material } from '@models/material';
import { NgbModal, NgbModalRef } from '@ng-bootstrap/ng-bootstrap';
import { LangChangeEvent, TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { PropertyMaterialService } from '@services/properties/property-material.service';
import { Pagination } from '@utilities/pagination-utility';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-property-material-main',
  templateUrl: './property-material-main.component.html',
  styleUrls: ['./property-material-main.component.scss']
})

export class PropertyMaterialMainComponent implements OnInit {
  lang: string = LangConstant.VN;
  iconButton = IconButton;
  pagination: Pagination = {
    pageNumber: 1,
    pageSize: 10,
  } as unknown as Pagination
  data: Material[];
  material?: Material;

  constructor(private spinner: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translate: TranslateService,
    private service: PropertyMaterialService,
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
      error: () => {
        this.snotifyService.error(
          this.translate.instant('System.Message.UnknowError'),
          this.translate.instant('System.Caption.Error'))
      }
    }).add(() => this.spinner.hide())
  }

  openModal(modalRef: TemplateRef<any>, material?: Material) {
    this.material = material;
    this.modalService.open(modalRef, { centered: true });
  }

  onClose(): void {
    this.modalService.dismissAll();
  }

  addMaterial(newItem: Material) {
    // this.data.push(newItem);
    this.getAll('');
  }

  delete(material: Material) {
    this.snotifyService.confirm(this.translate.instant('System.Message.ConfirmDeleteMsg'), this.translate.instant('System.Action.Delete'),
      () => {
        this.spinner.show();
        this.service.delete(material.id).subscribe({
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
