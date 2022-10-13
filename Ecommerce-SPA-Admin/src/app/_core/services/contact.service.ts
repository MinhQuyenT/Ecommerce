import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '@environments/environment';
import { Contact } from '@models/contact';
import { ContactParam } from '@params/contactParam';
import { OperationResult } from '@utilities/operation-result';
import { Pagination, PaginationResult } from '@utilities/pagination-utility';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ContactService {
  apiUrl: string = environment.apiUrl;
  constructor(private http: HttpClient) { }

  searchData(param: ContactParam, pagination: Pagination): Observable<PaginationResult<Contact>> {
   const params = new HttpParams().appendAll({ ...param, ...pagination });
    return this.http.post<PaginationResult<Contact>>(this.apiUrl + 'Contact/GetAll', { params });
  }

  deleteContact(contactId:number):Observable<OperationResult>{
    const params = new HttpParams().appendAll({contactId})
    return this.http.delete<OperationResult>(this.apiUrl + "Contact",{params})
  }

  deleteAllContact(listContact:Array<number>):Observable<OperationResult>{
    const params = new HttpParams().appendAll({listContact})
    return this.http.delete<OperationResult>(this.apiUrl + "Contact/DeleteAll",{params})
  }

  editContact(contactId:number):Observable<OperationResult>{
    const params = new HttpParams().appendAll({contactId})
    return this.http.put<OperationResult>(this.apiUrl + "Contact",{params})
  }

}
