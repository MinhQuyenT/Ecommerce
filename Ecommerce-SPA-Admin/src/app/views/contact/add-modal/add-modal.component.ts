import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { IconButton } from '@constants/common.constant';
import { Contact } from '@models/contact';
import { BsModalRef } from 'ngx-bootstrap/modal';
import { NgxNotiflixService, OperationResult } from 'ngx-spa-utilities';

@Component({
  selector: 'app-add-modal',
  templateUrl: './add-modal.component.html',
  styleUrls: ['./add-modal.component.css']
})
export class AddModalComponent implements OnInit {

  iconButton: typeof IconButton = IconButton;

  contactList: Contact = <Contact>{};
  contact_Bak: Contact = <Contact>{};
  @Output() contactSaved: EventEmitter<boolean> = new EventEmitter();

  constructor(
    public bsModalRef: BsModalRef,
    private notiflixService: NgxNotiflixService,
  ) { }

  ngOnInit() {
    this.contact_Bak = Object.assign({},this.contactList);
  }

  handleResult(event: OperationResult) {
    if (!event.isSuccess) {
      this.notiflixService.warning(event.error);
    }
  }

}
