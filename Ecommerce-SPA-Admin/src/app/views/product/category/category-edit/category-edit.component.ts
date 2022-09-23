import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { IconButton } from '@constants/common.constant';
import { environment } from '@environments/environment';
import { ProductCategory } from '@models/productCategory';
import { TranslateService } from '@ngx-translate/core';
import { CategoryService } from '@services/category.service';
import { NgSnotifyService } from '@services/ng-snotify.service';

@Component({
  selector: 'app-category-edit',
  templateUrl: './category-edit.component.html',
  styleUrls: ['./category-edit.component.css']
})
export class CategoryEditComponent implements OnInit {
  iconButton = IconButton;
  code: string;
  category: ProductCategory = <ProductCategory>{
    avartar: ''
  };
  baseUrl = environment.baseUrl;
  choose: boolean = false;
  categoryDB: ProductCategory;
  constructor(private route: ActivatedRoute,
              private router: Router,
              private categoryService: CategoryService,
              private snotifyService: NgSnotifyService,
              private translateService: TranslateService) { }

  ngOnInit() {
    this.code = this.route.snapshot.params['code'];
    this.getInfoCategory();
  }
  getInfoCategory() {
    this.categoryService.categoryInCode(this.code).subscribe(res => {
      this.choose = false;
      this.category = res;
      console.log(this.category);
      
      this.categoryDB = JSON.parse(JSON.stringify(res));
    })
  }
  chooseAvatar(event: any) {
    let files = ["jpg", "JPG", "jpeg", "JPEG", "png", "PNG"];
    const fileNameExtension = event.target.files[0].name.split(".").pop();
    if (files.includes(fileNameExtension)) {
      this.choose = true;
      let fileZise = event.target.files[0].size;
      const reader = new FileReader();
      reader.readAsDataURL(event.target.files[0]); // read file as data url
      reader.onload = (e) => {
        this.category.avartar = e.target.result.toString();
      };
    }
  }
  save() {
    let check = JSON.stringify(this.categoryDB) === JSON.stringify(this.category);
    if(check) {
      this.snotifyService.error(this.translateService.instant('System.Message.InfoNoChange'), this.translateService.instant('System.Caption.Error'));
    } else {
      this
      this.categoryService.editCategory(this.category).subscribe({
        next: (res) => {
          this.snotifyService.success(this.translateService.instant('System.Message.UpdateOKMsg'), this.translateService.instant('System.Caption.Success'));
          this.router.navigate(['/category']);
        },
        error: () => {

        }
      })
    }
  }
}
