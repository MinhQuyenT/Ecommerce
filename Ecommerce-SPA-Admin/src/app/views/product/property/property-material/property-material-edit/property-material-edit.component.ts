import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { IconButton } from '@constants/common.constant';
import { Material } from '@models/material';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { PropertyMaterialService } from '@services/properties/property-material.service';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-property-material-edit',
  templateUrl: './property-material-edit.component.html',
  styleUrls: ['./property-material-edit.component.scss']
})
export class PropertyMaterialEditComponent implements OnInit {
  @Input() material: Material;
  @Output() close: EventEmitter<void> = new EventEmitter<void>()
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
  onModalClose() {
    this.close.emit();
  }
  saveData() {
    this.spinner.show();
    let result = Object.assign(Object.assign({}, this.material), this.formData.value);
    this.service.update(result).subscribe({
      next: (res) => {
        if (res.isSuccess) {
          Object.assign(this.material, res.data);
          this.snotifyService.success(this.translate.instant('System.Message.UpdateOKMsg'), 
                                      this.translate.instant('System.Caption.Success'));
          this.onModalClose();
        }
        else {
          this.snotifyService.error(
            this.translate.instant('System.Message.UpdateErrorMsg'),
            this.translate.instant('System.Caption.Error'))
        }
      },
      error: (e) => {
        this.snotifyService.error(
          this.translate.instant('System.Message.UnknowError'),
          this.translate.instant('System.Caption.Error'))
      }
    }).add(() => this.spinner.hide())
  }

  initForm() {
    this.formData = this.formBuilder.group({
      name_en: [this.material?.name_en, [Validators.required]],
      name_vi: [this.material?.name_vi, [Validators.required]],
      description: [this.material?.description]
    });
  }
  reset() {
    this.initForm();
  }
}
