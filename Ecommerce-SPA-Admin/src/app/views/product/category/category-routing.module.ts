import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CategoryAddComponent } from './category-add/category-add.component';
import { CategoryEditComponent } from './category-edit/category-edit.component';
import { CategoryMainComponent } from './category-main/category-main.component';

const routes: Routes = [
  {
    path: '',
    component: CategoryMainComponent
  },
  {
    path: 'add',
    component: CategoryAddComponent
  },
  {
    path: 'edit/:code',
    component: CategoryEditComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CategoryRoutingModule { }
