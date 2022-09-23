import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ShopRoutingModule } from './shop-routing.module';
import { ShopMainComponent } from './shop-main/shop-main.component';
import { ShopSidebarComponent } from './shop-sidebar/shop-sidebar.component';
import { ShopListviewComponent } from './shop-listview/shop-listview.component';


@NgModule({
  declarations: [
    ShopMainComponent,
    ShopSidebarComponent,
    ShopListviewComponent
  ],
  imports: [
    CommonModule,
    ShopRoutingModule
  ]
})
export class ShopModule { }
