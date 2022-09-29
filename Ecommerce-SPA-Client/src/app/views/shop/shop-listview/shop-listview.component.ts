import { Component, OnInit } from '@angular/core';
import { InitJSUtility } from 'src/app/_core/utilities/init-js-utility';

@Component({
  selector: 'app-shop-listview',
  templateUrl: './shop-listview.component.html',
  styleUrls: ['./shop-listview.component.scss']
})
export class ShopListviewComponent implements OnInit {

  constructor(
    private initJsUtility: InitJSUtility
  ) { }

  ngOnInit(): void {
  }

}
