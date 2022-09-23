import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { IconButton } from '@constants/common.constant';
import { Color } from '@models/color';
import { TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { PropertyColorService } from '@services/properties/property-color.service';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-property-color-edit',
  templateUrl: './property-color-edit.component.html',
  styleUrls: ['./property-color-edit.component.scss']
})
export class PropertyColorEditComponent implements OnInit {
  @Input() color: Color;
  @Output() close: EventEmitter<void> = new EventEmitter<void>();
  iconButton = IconButton;
  formData: FormGroup;

  constructor(
    private formBuilder: FormBuilder,
    private service: PropertyColorService,
    private spinner: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translate: TranslateService,) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.formData = this.formBuilder.group({
      name_en: [this.color?.name_en, [Validators.required]],
      name_vi: [this.color?.name_vi, [Validators.required]],
      code: [this.color?.code, [Validators.required]],
      description: [this.color?.description]
    });
  }

  saveData() {
    this.spinner.show();
    let result = Object.assign(Object.assign({}, this.color), this.formData.value);
    this.service.update(result).subscribe({
      next: (res) => {
        if (res.isSuccess) {
          Object.assign(this.color, res.data);
          this.snotifyService.success(this.translate.instant('System.Message.UpdateOKMsg'), this.translate.instant('System.Caption.Success'));
          this.onModalClose();
        }
        else {
          this.snotifyService.error(
            this.translate.instant('System.Message.UpdateErrorMsg'),
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

  reset() {
    this.initForm();
  }
}
