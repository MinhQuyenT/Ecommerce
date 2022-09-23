import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '@environments/environment';
import { Color } from '@models/color';
import { OperationResult } from '@utilities/operation-result';
import { PaginationParam, PaginationResult } from '@utilities/pagination-utility';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PropertyColorService {
  apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getAll(pagination: PaginationParam, searchParam?: string): Observable<PaginationResult<Color>> {
    let params = new HttpParams().appendAll({ ...pagination, searchParam })
    return this.http.get<PaginationResult<Color>>(this.apiUrl + 'PropertyColor/GetAll', { params });
  }

  update(param: Color): Observable<OperationResult> {
    return this.http.put<OperationResult>(this.apiUrl + 'PropertyColor/Update', param);
  }

  add(param: Color): Observable<OperationResult> {
    return this.http.post<OperationResult>(this.apiUrl + 'PropertyColor/Add', param);
  }

  delete(id: number): Observable<boolean> {
    return this.http.delete<boolean>(this.apiUrl + 'PropertyColor/Delete', { params: { id } });
  }
}
