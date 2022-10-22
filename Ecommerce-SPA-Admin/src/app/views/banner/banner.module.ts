import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { BannerRoutingModule } from './banner-routing.module';
import { BannerComponent } from './banner/banner.component';
import { NgbModalModule } from '@ng-bootstrap/ng-bootstrap';


@NgModule({
  declarations: [
    BannerComponent
  ],
  imports: [
    CommonModule,
    NgbModalModule,
    BannerRoutingModule
  ]
})
export class BannerModule { }
