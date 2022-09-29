import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { ProductRoutingModule } from './product-routing.module';
import { ProductTabComponent } from './product-tab/product-tab.component';
import { ProductImgComponent } from './product-img/product-img.component';
import { ProductMetaComponent } from './product-meta/product-meta.component';
import { ProductMainComponent } from './product-main/product-main.component';
import { ProductFeatureComponent } from './product-feature/product-feature.component';
import { ProductRelatedComponent } from './product-related/product-related.component';
import { ProductRecentlyComponent } from './product-recently/product-recently.component';


@NgModule({
  declarations: [
    ProductMainComponent,
    ProductTabComponent,
    ProductImgComponent,
    ProductMetaComponent,
    ProductFeatureComponent,
    ProductRelatedComponent,
    ProductRecentlyComponent,
  ],
  imports: [
    CommonModule,
    ProductRoutingModule
  ]
})
export class ProductModule { }
