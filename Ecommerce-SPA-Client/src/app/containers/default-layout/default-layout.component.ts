import { Component, OnInit } from '@angular/core';
import { InitJSUtility } from 'src/app/_core/utilities/init-js-utility';

@Component({
  selector: 'app-default-layout',
  templateUrl: './default-layout.component.html',
  styleUrls: ['./default-layout.component.scss']
})
export class DefaultLayoutComponent implements OnInit {

  constructor(
    private initJsUtility: InitJSUtility
  ) { }

  ngOnInit(): void {
    this.initJsUtility.preLoad();
    this.initJsUtility.promotion();
    this.initJsUtility.notification();
    this.initJsUtility.scrollTop();
    this.initJsUtility.siteAnimation();
    this.initJsUtility.productLightBox();
    this.initJsUtility.productZoom();
    this.initJsUtility.productDetailSlide2();
    this.initJsUtility.productTab();

  }

}
