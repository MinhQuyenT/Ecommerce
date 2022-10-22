import { Component, OnInit } from '@angular/core';
import { Contact } from '@models/contact';
import { ContactParam } from '@params/contactParam';
import { ContactService } from '@services/contact.service';
import { BsModalRef, BsModalService } from 'ngx-bootstrap/modal';
import { NgxNotiflixService, Pagination } from 'ngx-spa-utilities';
import { catchError, firstValueFrom, of, tap } from 'rxjs';
import { AddModalComponent } from '../add-modal/add-modal.component';

@Component({
  selector: 'app-contact',
  templateUrl: './contact.component.html',
  styleUrls: ['./contact.component.scss']
})
export class ContactComponent implements OnInit {

  contact: Contact[] = [];
  bsModalRef?: BsModalRef;
  param: ContactParam = <ContactParam>{};
  pagination: Pagination = <Pagination>{}

  constructor(
    private modalService: BsModalService,
    private notiflixService: NgxNotiflixService,
    private contactService: ContactService,
    
  ) { }

  ngOnInit() {
  }

  addNewModal(): void {
    let contactList: Contact = <Contact>{}
    this.bsModalRef = this.modalService.show(AddModalComponent, {class: 'modal-xl', keyboard: false });
    console.log(this.bsModalRef);
  }

  async getAll() {
    this.notiflixService.showLoading();
    await firstValueFrom(this.contactService.searchData(this.param, this.pagination).pipe((
      tap( (res:any) => {
        this.notiflixService.hideLoading();
        this.contact = res;
      }),
      catchError(()=>{
        this.notiflixService.hideLoading();
        this.notiflixService.error("UnknownError");
        return of(null);
      })
    )))
  }

}
