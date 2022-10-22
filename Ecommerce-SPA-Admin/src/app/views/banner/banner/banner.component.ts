import { Component, OnInit } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AddModalComponent } from '../../contact/add-modal/add-modal.component';

@Component({
  selector: 'app-banner',
  templateUrl: './banner.component.html',
  styleUrls: ['./banner.component.scss']
})
export class BannerComponent implements OnInit {

  constructor(
    private modalService: NgbModal
  ) { }

  ngOnInit() {
  }


  addNewModal(): void {
    const modalRef = this.modalService.open(AddModalComponent);
    modalRef.componentInstance.name = 'Add New';
    console.log(modalRef);
  }


}
