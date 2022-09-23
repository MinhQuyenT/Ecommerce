import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { TranslateModule } from '@ngx-translate/core';
import { ColorPickerModule } from 'ngx-color-picker';
import { UIModule } from 'src/app/shared/ui/ui.module';
import { NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';

import { PropertySizeEditComponent } from './property-size-edit/property-size-edit.component';
import { PropertySizeAddComponent } from './property-size-add/property-size-add.component';
import { PropertySizeMainComponent } from './property-size-main/property-size-main.component';
import { PropertySizeRoutingModule } from './property-size-routing.module';
import { PropertySizeResolver } from '@resolvers/properties/property-size.resolver';


@NgModule({
  declarations: [
    PropertySizeMainComponent,
    PropertySizeAddComponent,
    PropertySizeEditComponent
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
    PropertySizeRoutingModule
  ],
  providers: [
    PropertySizeResolver
  ],
})
export class PropertySizeModule { }
