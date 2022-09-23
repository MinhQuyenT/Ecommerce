import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LookbookRoutingModule } from './lookbook-routing.module';
import { LookbookComponent } from './lookbook/lookbook.component';


@NgModule({
  declarations: [
    LookbookComponent
  ],
  imports: [
    CommonModule,
    LookbookRoutingModule
  ]
})
export class LookbookModule { }
