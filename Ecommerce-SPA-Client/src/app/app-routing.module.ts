import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DefaultLayoutComponent } from './containers/default-layout/default-layout.component';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: '',
    component: DefaultLayoutComponent,
    data: {
      title: 'Home'
    },
    children: [
      {
        path: 'home',
        loadChildren: () => import("./views/home/home.module").then(m => m.HomeModule)
      },
      {
        path: 'collection',
        loadChildren: () => import("./views/collection/collection.module").then(m => m.CollectionModule)
      },
      {
        path: 'shop',
        loadChildren: () => import("./views/shop/shop.module").then(m => m.ShopModule)
      },
      {
        path: 'lookbook',
        loadChildren: () => import("./views/lookbook/lookbook.module").then(m => m.LookbookModule)
      },
      {
        path: 'faqs',
        loadChildren: () => import("./views/faqs/faqs.module").then(m => m.FaqsModule)
      }
    ]
  },
  { path: '**', redirectTo: 'home', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { relativeLinkResolution: 'legacy'})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
