import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TranslateModule } from '@ngx-translate/core';

import { PropertyColorMainComponent } from './property-color-main/property-color-main.component';
import { PropertyColorAddComponent } from './property-color-add/property-color-add.component';
import { PropertyColorEditComponent } from './property-color-edit/property-color-edit.component';
import { PropertyColorRoutingModule } from './property-color-routing.module';
import { ColorPickerModule } from 'ngx-color-picker';
import { UIModule } from 'src/app/shared/ui/ui.module';
import { NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';

@NgModule({
  declarations: [
    PropertyColorMainComponent,
    PropertyColorAddComponent,
    PropertyColorEditComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    NgbPaginationModule,
    UIModule,
    ColorPickerModule,
    ReactiveFormsModule,
    TranslateModule,
    PropertyColorRoutingModule
  ]
})
export class PropertyColorModule { }
