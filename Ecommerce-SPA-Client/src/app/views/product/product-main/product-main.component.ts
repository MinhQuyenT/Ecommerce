import { Component, OnInit } from '@angular/core';
import { InitJSUtility } from 'src/app/_core/utilities/init-js-utility';

@Component({
  selector: 'app-product-main',
  templateUrl: './product-main.component.html',
  styleUrls: ['./product-main.component.scss']
})
export class ProductMainComponent implements OnInit {

  constructor(
    private initJsUtility: InitJSUtility
  ) { }

  ngOnInit(): void {
    this.initJsUtility.bodyProduct();
  }

}
