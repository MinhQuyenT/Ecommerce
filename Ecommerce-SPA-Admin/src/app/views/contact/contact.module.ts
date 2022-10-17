import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ContactRoutingModule } from './contact-routing.module';
import { ContactComponent } from './contact/contact.component';
import { AddModalComponent } from './add-modal/add-modal.component';
import { ModalModule } from 'ngx-bootstrap/modal';
import { TooltipModule } from 'ngx-bootstrap/tooltip';


@NgModule({
  declarations: [
    ContactComponent,
    AddModalComponent
  ],
  imports: [
    ModalModule.forRoot(),
    TooltipModule.forRoot(),
    CommonModule,
    ContactRoutingModule,
  ]
})
export class ContactModule { }
