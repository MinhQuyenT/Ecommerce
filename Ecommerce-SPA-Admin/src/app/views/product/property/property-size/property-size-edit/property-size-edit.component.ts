import { Component, OnInit } from '@angular/core';
import { UntypedFormBuilder, UntypedFormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { IconButton } from '@constants/common.constant';
import { LangConstant } from '@constants/lang.constant';
import { Size } from '@models/size';
import { TranslateService } from '@ngx-translate/core';
import { NgSnotifyService } from '@services/ng-snotify.service';
import { PropertySizeService } from '@services/properties/property-size.service';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-property-size-edit',
  templateUrl: './property-size-edit.component.html',
  styleUrls: ['./property-size-edit.component.scss']
})
export class PropertySizeEditComponent implements OnInit {
  lang: string = LangConstant.VN;
  iconButton = IconButton;
  formData: UntypedFormGroup;
  dataSize: Size;

  constructor(private spinner: NgxSpinnerService,
    private snotifyService: NgSnotifyService,
    private translate: TranslateService,
    private service: PropertySizeService,
    private route: ActivatedRoute,
    private router: Router,
    private formBuilder: UntypedFormBuilder) { }

  ngOnInit() {
    this.route.data.subscribe(data => {
      this.dataSize = data['size'];
      this.initForm();
    })
  }

  initForm() {
    let size = this.dataSize;
    this.formData = this.formBuilder.group({
      name: [size.name, [Validators.required]],
      bust: [size.bust.slice(0, size.bust.indexOf('-')), [Validators.required]],
      bust2: [size.bust.slice(size.bust.indexOf('-') + 1, size.bust.length), [Validators.required]],
      waist: [size.waist.slice(0, size.waist.indexOf('-')), [Validators.required]],
      waist2: [size.waist.slice(size.waist.indexOf('-') + 1, size.waist.length), [Validators.required]],
      hip: [size.hip.slice(0, size.hip.indexOf('-')), [Validators.required]],
      hip2: [size.hip.slice(size.hip.indexOf('-') + 1, size.hip.length), [Validators.required]],
      weight: [size.weight.slice(0, size.weight.indexOf('-')), [Validators.required]],
      weight2: [size.weight.slice(size.weight.indexOf('-') + 1, size.weight.length), [Validators.required]],
      height: [size.height.slice(0, size.height.indexOf('-')), [Validators.required]],
      height2: [size.height.slice(size.height.indexOf('-') + 1, size.height.length), [Validators.required]],
      description: [size?.description]
    });
  }

  saveData() {
    this.spinner.show();
    let data = Object.assign({}, this.formData.value);

    this.formatValueForm();
    let result = Object.assign(this.dataSize, this.formData.value);
    this.service.update(result).subscribe({
      next: (res) => {
        if (res.isSuccess) {
          this.snotifyService.success(this.translate.instant('System.Message.UpdateOKMsg'), 
                                      this.translate.instant('System.Caption.Success'));
          this.router.navigate(['/properties/size']);
        }
        else {
          Object.assign(this.formData.value, data);
          this.snotifyService.error(
            this.translate.instant('System.Message.UpdateErrorMsg'),
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
