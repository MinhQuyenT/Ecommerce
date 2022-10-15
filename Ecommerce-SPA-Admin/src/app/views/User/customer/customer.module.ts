import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CustomerRoutingModule } from './customer-routing.module';
import { CustomerComponent } from './main/customer.component';
import { EditorModule,TINYMCE_SCRIPT_SRC  } from '@tinymce/tinymce-angular';
import { UpdateComponent } from './update/update.component';


@NgModule({
  declarations: [
    CustomerComponent,
    UpdateComponent
  ],
  imports: [
    CommonModule,
    CustomerRoutingModule,

    EditorModule
  ],
  providers: [
    { provide: TINYMCE_SCRIPT_SRC, useValue: 'tinymce/tinymce.min.js' }
  ]
})
export class CustomerModule { }
