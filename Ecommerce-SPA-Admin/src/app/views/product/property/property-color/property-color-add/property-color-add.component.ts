import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { UntypedFormBuilder, UntypedFormGroup, Validators } from '@angular/forms';
import { IconButton } from '@constants/common.constant';
import { Color } from '@models/color';
import { TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { PropertyColorService } from '@services/properties/property-color.service';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-property-color-add',
  templateUrl: './property-color-add.component.html',
  styleUrls: ['./property-color-add.component.scss']
})
export class PropertyColorAddComponent implements OnInit {
  @Output() newItemEvent = new EventEmitter<Color>();
  @Output() close: EventEmitter<void> = new EventEmitter<void>();
  iconButton = IconButton;
  formData: UntypedFormGroup;

  constructor(
    private formBuilder: UntypedFormBuilder,
    private service: PropertyColorService,
    private spinner: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translate: TranslateService) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    this.formData = this.formBuilder.group({
      name_en: ['', [Validators.required]],
      name_vi: ['', [Validators.required]],
      code: ['#FFFFFF', [Validators.required]],
      description: ['']
    });
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

  reset() {
    this.initForm();
  }
}