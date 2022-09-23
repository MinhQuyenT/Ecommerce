import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { PaginationParam, PaginationResult } from '@utilities/pagination-utility';
import { environment } from 'src/environments/environment';
import { ProductCategory } from '../models/productCategory';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {
  apiUrl = environment.apiUrl;
  constructor(private http: HttpClient) { }
  search(pagination: PaginationParam, param: string) {
    let params = new HttpParams().appendAll({...pagination, param})
    return this.http.get<PaginationResult<ProductCategory>>(this.apiUrl + 'Category/search', {params});
  }
  addCategory(model: ProductCategory) {
    return this.http.post<boolean>(this.apiUrl + 'Category/addCategory', model);
  }
  categoryInCode(code: string) {
    let params = new HttpParams().set('code', code);
    return this.http.get<ProductCategory>(this.apiUrl + 'Category/categoryInCode', {params})
  }
  editCategory(model: ProductCategory) {
    return this.http.put<boolean>(this.apiUrl + 'Category/editCategory', model);
  }
}
