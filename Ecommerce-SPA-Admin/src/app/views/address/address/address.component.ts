import { KeyValue } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { AddressService } from '@services/address.service';
import { MSG_CONST, NgxNotiflixService } from 'ngx-spa-utilities';
import { firstValueFrom } from 'rxjs';

@Component({
  selector: 'app-address',
  templateUrl: './address.component.html',
  styleUrls: ['./address.component.scss']
})
export class AddressComponent implements OnInit {

  file: File | null = null;
  provinceID: string = '';
  districtID: string = '';
  wardID: string = '';
  provinces: KeyValue<string, string>[] = [];
  districts: KeyValue<string, string>[] = [];
  wards: KeyValue<string, string>[] = [];


  constructor(private notiflixService: NgxNotiflixService,
  private addressService: AddressService
  ) { }

  async ngOnInit() {
    await this.getProvineces();
  }

  async getProvineces():Promise<void>{
    this.provinceID = '';
    this.provinces = await firstValueFrom(this.addressService.getProvinces());

    this.districtID = '';
    this.districts = [];

    this.wardID = ''
    this.wards = [];
  }



}
