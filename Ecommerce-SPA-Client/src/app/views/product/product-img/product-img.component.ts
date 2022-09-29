import { Component, OnInit } from '@angular/core';
import { InitJSUtility } from 'src/app/_core/utilities/init-js-utility';

@Component({
  selector: 'app-product-img',
  templateUrl: './product-img.component.html',
  styleUrls: ['./product-img.component.scss']
})
export class ProductImgComponent implements OnInit {

  constructor(
    private initJsUtility: InitJSUtility
  ) { }

  ngOnInit(): void {
    this.initJsUtility.productLightBox();
    this.initJsUtility.productZoom();
    this.initJsUtility.productPopup();
    this.initJsUtility.productDetailSlide();
  }

}
