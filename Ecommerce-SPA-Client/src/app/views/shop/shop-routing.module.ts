import { ShopDetailComponent } from './shop-detail/shop-detail.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ShopListviewComponent } from './shop-listview/shop-listview.component';
import { ShopMainComponent } from './shop-main/shop-main.component';

const routes: Routes = [
  {
    path: '',
    data: {
      title: 'Shop'
    },
    component: ShopMainComponent
  },
  {
    path: 'listview',
    data: {
      title: 'Shop'
    },
    component: ShopListviewComponent
  },
  {
    path: 'shop-detail/:id/:name',
    data: {
      title: 'Shop Detail'
    },
    component: ShopDetailComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ShopRoutingModule { }
