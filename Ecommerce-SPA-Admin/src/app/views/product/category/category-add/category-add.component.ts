import { Component, OnInit } from '@angular/core';
import { IconButton } from '@constants/common.constant';
import { ProductCategory } from '@models/productCategory';
import { CategoryService } from '@services/category.service';
import { NgSnotifyService } from '@services/ng-snotify.service';

@Component({
  selector: 'app-category-add',
  templateUrl: './category-add.component.html',
  styleUrls: ['./category-add.component.css']
})
export class CategoryAddComponent implements OnInit {
  category: ProductCategory = <ProductCategory>{
    avartar: ''
  };
  iconButton = IconButton;
  constructor(private categoryService: CategoryService,
              private snotifyService: NgSnotifyService) { }

  ngOnInit() {
  }
  chooseAvatar(event: any) {
    let files = ["jpg", "JPG", "jpeg", "JPEG", "png", "PNG"];
    const fileNameExtension = event.target.files[0].name.split(".").pop();
    if (files.includes(fileNameExtension)) {
      let fileZise = event.target.files[0].size;
      const reader = new FileReader();
      reader.readAsDataURL(event.target.files[0]); // read file as data url
      reader.onload = (e) => {
        this.category.avartar = e.target.result.toString();
      };
    }
  }
  save() {
    this.categoryService.addCategory(this.category).subscribe({
      next: (res) => {
        if(res) {
          this.snotifyService.success('Thêm thành công','Thành công');
          this.category = <ProductCategory>{};
          (<HTMLInputElement>document.getElementById('formFile')).value = '';
        }
      }
    })
  }
  clear() {
    this.category = <ProductCategory>{
      avartar: ''
    };
  }
}
