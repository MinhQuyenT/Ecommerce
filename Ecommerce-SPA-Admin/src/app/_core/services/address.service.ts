import { KeyValue } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '@environments/environment';
import { FunctionUtility } from '@utilities/fucntion-utility';
import { OperationResult } from '@utilities/operation-result';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class AddressService {

  apiUrl: string = environment.apiUrl;

  constructor(
    private http: HttpClient,
    private functionUtility: FunctionUtility
  ) { }

  getProvinces():Observable<KeyValue<string,string>[]>{
    return this.http.get<KeyValue<string,string>[]>(this.apiUrl + "Address/Provinces")
  }

  getDistricts(provinceID: string):Observable<KeyValue<string,string>[]>{
    return this.http.get<KeyValue<string,string>[]>(this.apiUrl + "Address/District",{ params: { provinceID } })
  }

  getWards(districtID: string):Observable<KeyValue<string,string>[]>{
    return this.http.get<KeyValue<string,string>[]>(this.apiUrl + "Address/Ward",{ params: { districtID } })
  }

  uploadExcel(file:File):Observable<OperationResult>{
    var formData:FormData = this.functionUtility.toFormData(file);
    return this.http.post<OperationResult>(this.apiUrl,formData)
  }
}
