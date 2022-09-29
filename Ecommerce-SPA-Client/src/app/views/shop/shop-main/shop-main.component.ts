import { Component, OnInit } from '@angular/core';
import { InitJSUtility } from 'src/app/_core/utilities/init-js-utility';

@Component({
  selector: 'app-shop-main',
  templateUrl: './shop-main.component.html',
  styleUrls: ['./shop-main.component.scss']
})
export class ShopMainComponent implements OnInit {

  constructor(
    private initJsUtility: InitJSUtility
  ) { }

  ngOnInit(): void {
  }

}
