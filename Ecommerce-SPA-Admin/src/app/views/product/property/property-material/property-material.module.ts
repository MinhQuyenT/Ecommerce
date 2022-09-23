import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TranslateModule } from '@ngx-translate/core';
import { ColorPickerModule } from 'ngx-color-picker';
import { UIModule } from 'src/app/shared/ui/ui.module';
import { NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';

import { PropertyMaterialAddComponent } from './property-material-add/property-material-add.component';
import { PropertyMaterialMainComponent } from './property-material-main/property-material-main.component';
import { PropertyMaterialEditComponent } from './property-material-edit/property-material-edit.component';
import { PropertyMaterialRoutingModule } from './property-material-routing.module';

@NgModule({
  declarations: [
    PropertyMaterialMainComponent,
    PropertyMaterialAddComponent,
    PropertyMaterialEditComponent
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
    PropertyMaterialRoutingModule
  ]
})
export class PropertyMaterialModule { }
