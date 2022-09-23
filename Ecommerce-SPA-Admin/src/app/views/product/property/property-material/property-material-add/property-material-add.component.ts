import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { IconButton } from '@constants/common.constant';
import { Material } from '@models/material';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { PropertyMaterialService } from '@services/properties/property-material.service';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-property-material-add',
  templateUrl: './property-material-add.component.html',
  styleUrls: ['./property-material-add.component.scss']
})
export class PropertyMaterialAddComponent implements OnInit {
  @Output() newItemEvent = new EventEmitter<Material>();
  @Output() close: EventEmitter<void> = new EventEmitter<void>();
  iconButton = IconButton;
  formData: FormGroup;

  constructor(private modalService: NgbModal,
    private formBuilder: FormBuilder,
    private service: PropertyMaterialService,
    private spinner: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translate: TranslateService,) { }

  ngOnInit() {
    this.initForm();
  }

  saveData() {
    this.spinner.show();
    const result = Object.assign({}, this.formData.value);
    this.service.add(result).subscribe({
      next: (res) => {
        if (res.isSuccess) {
          this.newItemEvent.emit(res.data);
          this.snotifyService.success(this.translate.instant('System.Message.CreateOKMsg'), 
                                      this.translate.instant('System.Caption.Success'));
          this.onModalClose();
        }
        else {
          this.snotifyService.error(
            this.translate.instant('System.Message.CreateErrorMsg'),
            this.translate.instant('System.Caption.Error'))
        }
      },
      error: () => {
        this.snotifyService.error(
          this.translate.instant('System.Message.UnknowError'),
          this.translate.instant('System.Caption.Error'))
      }
    }).add(() => this.spinner.hide())
  }

  onModalClose() {
    this.close.emit();
  }

  initForm() {
    this.formData = this.formBuilder.group({
      name_en: ["", [Validators.required]],
      name_vi: ["", [Validators.required]],
      description: [""]
    });
  }
  
  reset() {
    this.initForm();
  }
}
