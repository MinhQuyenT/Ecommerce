import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ContactRoutingModule } from './contact-routing.module';
import { ContactComponent } from './contact/contact.component';
import { AddModalComponent } from './add-modal/add-modal.component';
import { ModalModule } from 'ngx-bootstrap/modal';
import { TooltipModule } from 'ngx-bootstrap/tooltip';
import { NgbDropdownModule, NgbModal, NgbModalModule } from '@ng-bootstrap/ng-bootstrap';
import { BrowserModule } from '@angular/platform-browser';
import { DropzoneModule } from 'ngx-dropzone-wrapper';
import { FormsModule } from '@angular/forms';
import { MediaUploaderComponent } from 'ngx-spa-utilities';


@NgModule({
  declarations: [
    ContactComponent,
    AddModalComponent
  ],
  imports: [
    MediaUploaderComponent,
    FormsModule,
    NgbDropdownModule,
    DropzoneModule,
    CommonModule,
    ModalModule.forRoot(),
    ContactRoutingModule,
  ]
})
export class ContactModule { }
