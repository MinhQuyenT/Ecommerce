import { Component, OnInit } from '@angular/core';
import { InitJSUtility } from 'src/app/_core/utilities/init-js-utility';

@Component({
  selector: 'app-product-meta',
  templateUrl: './product-meta.component.html',
  styleUrls: ['./product-meta.component.scss']
})
export class ProductMetaComponent implements OnInit {

  constructor(
    private initJsUtility: InitJSUtility
  ) { }

  ngOnInit(): void {
    this.initJsUtility.quantityMinus();
  }

}
