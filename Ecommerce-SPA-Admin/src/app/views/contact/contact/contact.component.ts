import { Component, OnInit } from '@angular/core';
import { Contact } from '@models/contact';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { AddModalComponent } from '../add-modal/add-modal.component';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {
  
  contact: Contact = <Contact>{ status: true };
  bsModalRef?: BsModalRef;

  constructor(
    private modalService: BsModalService,
  ) { }

  ngOnInit() {
  }

  addNewModal(): void {
    let contactList :  Contact = <Contact>{}
    this.bsModalRef = this.modalService.show(AddModalComponent, {  initialState: {  }, keyboard: false });
    console.log(this.bsModalRef);
    
  }

}
