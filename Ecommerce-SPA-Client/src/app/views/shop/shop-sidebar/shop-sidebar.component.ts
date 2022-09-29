import { Component, OnInit } from '@angular/core';
import { InitJSUtility } from 'src/app/_core/utilities/init-js-utility';

@Component({
  selector: 'app-shop-sidebar',
  templateUrl: './shop-sidebar.component.html',
  styleUrls: ['./shop-sidebar.component.scss']
})
export class ShopSidebarComponent implements OnInit {

  constructor(
    private initJsUtility: InitJSUtility
  ) { }

  ngOnInit(): void {
    this.initJsUtility.togglefilterWidget();
    this.initJsUtility.categorySlide();
    this.initJsUtility.priceRange();
    this.initJsUtility.colorSwacthes();
  }

}
