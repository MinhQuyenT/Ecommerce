import { KeyValue } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { AddressService } from '@services/address.service';
import { MSG_CONST, NgxNotiflixService } from 'ngx-spa-utilities';
import { promise } from 'protractor';
import { catchError, firstValueFrom, of, tap } from 'rxjs';

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
  provinceName: string = '';
  districtName: string = '';
  wardName: string = '';
  provinces: KeyValue<string, string>[] = [];
  districts: KeyValue<string, string>[] = [];
  wards: KeyValue<string, string>[] = [];


  constructor(private notiflixService: NgxNotiflixService,
    private addressService: AddressService
  ) { }

  async ngOnInit() {
    await this.getProvineces();
    console.log(this.provinces);

  }

  async getProvineces(): Promise<void> {
    this.provinceID = '';
    this.provinces = await firstValueFrom(this.addressService.getProvinces());

    this.districtID = '';
    this.districts = [];

    this.wardID = ''
    this.wards = [];
  }

  async getDistricts(): Promise<void> {
    if (this.provinceID) {
      this.districtID = '';
      this.districts = await firstValueFrom(this.addressService.getDistricts(this.provinceID));

      this.wardID = ''
      this.wards = [];
    }
  }

  async getWards():Promise<void>{
    if(this.districtID){
      this.wardID = '';
      this.wards = await firstValueFrom(this.addressService.getWards(this.districtID))
    }
  }

  async provinceChanged(): Promise<void> {
    await this.getDistricts();
  }

  async districtChanged(): Promise<void> {
    await this.getWards();
  }

  onFileChanged(event: any) {
    if (event.target.files && event.target.files[0]) {
      const file: File = event.target.files[0];
      if (file.name.includes('xlsx') || file.name.includes('xls')) {
        this.file = event.target.files[0];
      } else {
        this.notiflixService.error(MSG_CONST.INVALID_FILE_TYPE);
        this.file = null;
        event.target.value = '';
      }
    } else {
      this.file = null;
      event.target.value = '';
    }
  }

  async uploadExcel() {
    if (this.file) {
      this.notiflixService.showLoading();
      await firstValueFrom(this.addressService.uploadExcel(this.file).pipe(
        tap(async res => {
          this.notiflixService.hideLoading();
          this.file = null;
          if (res.isSuccess) {
            this.notiflixService.success(MSG_CONST.UPLOADED);
            await this.getProvineces();
          } else {
            this.notiflixService.error(MSG_CONST.UPLOAD_FAILED);
          }
        }),
        catchError(() => {
          this.notiflixService.hideLoading();
          this.notiflixService.error(MSG_CONST.UNKNOWN_ERROR);
          return of();
        })
      ));
    }
  }


}
