import { Component, OnInit } from '@angular/core';
import { Pagination } from '@utilities/pagination-utility';
import { NgxSpinnerService } from 'ngx-spinner';
import { ProductCategory } from '@models/productCategory';
import { CategoryService } from '@services/category.service';
import { IconButton } from '@constants/common.constant';
import { environment } from '@environments/environment';
import { Router } from '@angular/router';
import { TranslateService } from '@ngx-translate/core';
@Component({
  selector: 'app-category-main',
  templateUrl: './category-main.component.html',
  styleUrls: ['./category-main.component.scss']
})
export class CategoryMainComponent implements OnInit {
  iconButton = IconButton;
  categorys: ProductCategory[] = [];
  pagination: Pagination = <Pagination>{
    pageNumber: 1,
    pageSize: 10
  };
  paramSearch: string = '';
  baseUrl = environment.baseUrl;
  lang: string;
  constructor(private categoryService: CategoryService,
              private spinnerService: NgxSpinnerService,
              private router: Router,
              private translate: TranslateService) { }

  ngOnInit() {
    this.getData('');
    this.translate.onLangChange.subscribe(res => {
      this.lang = res.lang;
    })
  }
  search() {
    this.pagination.pageNumber = 1;
    this.getData(this.paramSearch);
  }
  getData(param: string) { 
    this.spinnerService.show();
    this.categoryService.search(this.pagination, param).subscribe(res => {
      this.categorys = res.result;
      this.pagination = res.pagination;
      this.spinnerService.hide();
    })
  }
  changePaged(event: any) {
    this.pagination.pageNumber = event;
    this.getData(this.paramSearch);
  }
  editCategory(model: ProductCategory) {
    this.router.navigate(['category/edit/', model.code])
  }

}
