import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { IconButton } from '@constants/common.constant';
import { LangConstant } from '@constants/lang.constant';
import { TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { PropertySizeService } from '@services/properties/property-size.service';
import { NgxSpinnerService, Size } from 'ngx-spinner';

@Component({
  selector: 'app-property-size-add',
  templateUrl: './property-size-add.component.html',
  styleUrls: ['./property-size-add.component.scss']
})
export class PropertySizeAddComponent implements OnInit {
  lang: string = LangConstant.VN;
  iconButton = IconButton;
  formData: FormGroup;
  dataSize: Size;

  constructor(private spinner: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translate: TranslateService,
    private service: PropertySizeService,
    private formBuilder: FormBuilder) { }

  ngOnInit() {
    this.initForm();
  }

  initForm() {
    let size = this.dataSize;
    this.formData = this.formBuilder.group({
      name: ['', [Validators.required]],
      bust: ['', [Validators.required]],
      bust2: ['', [Validators.required]],
      waist: ['', [Validators.required]],
      waist2: ['', [Validators.required]],
      hip: ['', [Validators.required]],
      hip2: ['', [Validators.required]],
      weight: ['', [Validators.required]],
      weight2: ['', [Validators.required]],
      height: ['', [Validators.required]],
      height2: ['', [Validators.required]],
      description: ['']
    });
  }

  saveData() {
    this.spinner.show();
    let data = Object.assign({}, this.formData.value);
    this.formatValueForm();

    this.service.add(this.formData.value).subscribe({
      next: (res) => {
        if (res.isSuccess) {
          this.snotifyService.success(this.translate.instant('System.Message.CreateOKMsg'), 
                                      this.translate.instant('System.Caption.Success'));
          this.initForm();
        }
        else {
          Object.assign(this.formData.value, data);
          this.snotifyService.error(
            this.translate.instant('System.Message.CreateErrorMsg'),
            this.translate.instant('System.Caption.Error'))
        }
      },
      error: () => {
        Object.assign(this.formData.value, data);
        this.snotifyService.error(
          this.translate.instant('System.Message.UnknowError'),
          this.translate.instant('System.Caption.Error'))
      }
    }).add(() => this.spinner.hide())
  }

  reset() {
    this.initForm();
  }

  formatValueForm() {
    let data = this.formData.value;
    data.bust += '-' + data.bust2;
    data.waist += '-' + data.waist2;
    data.hip += '-' + data.hip2;
    data.weight += '-' + data.weight2;
    data.height += '-' + data.height2;
  }
}