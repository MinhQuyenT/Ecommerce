import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CollectionCategoryComponent } from './collection-category/collection-category.component';

const routes: Routes = [
  {
    path: '',
    data: {
      title: 'Collection Category'
    },
    component: CollectionCategoryComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CollectionRoutingModule { }
