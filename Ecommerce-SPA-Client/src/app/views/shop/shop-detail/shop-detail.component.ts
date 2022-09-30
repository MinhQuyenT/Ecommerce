import { AfterContentInit, AfterViewInit, Component, ElementRef, OnInit } from '@angular/core';
import { FunctionUtility } from 'src/app/_core/utilities/fucntion-utility';
import { InitJSUtility } from 'src/app/_core/utilities/init-js-utility';

@Component({
  selector: 'app-shop-detail',
  templateUrl: './shop-detail.component.html',
  styleUrls: ['./shop-detail.component.scss']
})
export class ShopDetailComponent implements OnInit {

  constructor(private initJsUtility: InitJSUtility) { }

  ngOnInit() {
    this.initJsUtility.productZoom();
  }
}
