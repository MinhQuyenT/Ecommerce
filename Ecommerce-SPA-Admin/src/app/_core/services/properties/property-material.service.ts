import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from '@environments/environment';
import { Material } from '@models/material';
import { OperationResult } from '@utilities/operation-result';
import { PaginationParam, PaginationResult } from '@utilities/pagination-utility';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PropertyMaterialService {
  apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getAll(pagination: PaginationParam, searchParam?: string): Observable<PaginationResult<Material>> {
    let params = new HttpParams().appendAll({ ...pagination, searchParam })
    return this.http.get<PaginationResult<Material>>(this.apiUrl + 'PropertyMaterial/GetAll', { params });
  }

  update(param: Material): Observable<OperationResult> {
    return this.http.put<OperationResult>(this.apiUrl + 'PropertyMaterial/Update', param);
  }

  add(param: Material): Observable<OperationResult> {
    return this.http.post<OperationResult>(this.apiUrl + 'PropertyMaterial/Add', param);
  }

  delete(id: number): Observable<boolean> {
    return this.http.delete<boolean>(this.apiUrl + 'PropertyMaterial/Delete', { params: { id } });
  }
}
