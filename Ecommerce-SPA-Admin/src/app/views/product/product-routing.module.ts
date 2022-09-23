import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ProductMainComponent } from './product-main/product-main.component';

const routes: Routes = [
  {
    path: '',
    component: ProductMainComponent
  },
  {
    path: 'category',
    loadChildren: () => import('./category/category.module').then(m => m.CategoryModule)
  },
  {
    path: 'property',
    loadChildren: () => import('./property/properties.module').then(m => m.PropertiesModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProductRoutingModule { }
