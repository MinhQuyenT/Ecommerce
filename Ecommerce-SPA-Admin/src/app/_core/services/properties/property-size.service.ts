import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '@environments/environment';
import { Size } from '@models/size';
import { OperationResult } from '@utilities/operation-result';
import { PaginationParam, PaginationResult } from '@utilities/pagination-utility';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PropertySizeService {
  apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getAll(pagination: PaginationParam, searchParam?: string): Observable<PaginationResult<Size>> {
    let params = new HttpParams().appendAll({ ...pagination, searchParam })
    return this.http.get<PaginationResult<Size>>(this.apiUrl + 'PropertySize/GetAll', { params });
  }

  getSize(id: number): Observable<Size> {
    return this.http.get<Size>(this.apiUrl + 'PropertySize/GetSize', { params: { id } });
  }

  update(param: Size): Observable<OperationResult> {
    return this.http.put<OperationResult>(this.apiUrl + 'PropertySize/Update', param);
  }

  add(param: Size): Observable<OperationResult> {
    return this.http.post<OperationResult>(this.apiUrl + 'PropertySize/Add', param);
  }

  delete(id: number): Observable<boolean> {
    return this.http.delete<boolean>(this.apiUrl + 'PropertySize/Delete', { params: { id } });
  }
}
