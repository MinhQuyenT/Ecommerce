import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { CategoryRoutingModule } from './category-routing.module';
import { CategoryMainComponent } from './category-main/category-main.component';
import { UIModule } from 'src/app/shared/ui/ui.module';
import { NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgxSpinnerModule } from 'ngx-spinner';
import { CategoryAddComponent } from './category-add/category-add.component';
import { CategoryEditComponent } from './category-edit/category-edit.component';
import { TranslateModule } from '@ngx-translate/core';


@NgModule({
  declarations: [
    CategoryMainComponent,
    CategoryAddComponent,
    CategoryEditComponent
  ],
  imports: [
    CommonModule,
    FormsModule,
    ReactiveFormsModule,
    UIModule,
    TranslateModule,
    NgxSpinnerModule,
    NgbPaginationModule,
    CategoryRoutingModule
  ]
})
export class CategoryModule { }
