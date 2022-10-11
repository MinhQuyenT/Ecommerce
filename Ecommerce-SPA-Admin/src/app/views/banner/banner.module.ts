import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BannerRoutingModule } from './banner-routing.module';
import { BannerComponent } from './banner/banner.component';


@NgModule({
  declarations: [
    BannerComponent
  ],
  imports: [
    CommonModule,
    BannerRoutingModule
  ]
})
export class BannerModule { }
