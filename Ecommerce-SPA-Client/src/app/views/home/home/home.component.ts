import { Component, OnInit } from '@angular/core';
import { InitJSUtility } from 'src/app/_core/utilities/init-js-utility';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit {

  constructor(
    private initJsUtility: InitJSUtility
  ) { }

  ngOnInit(): void {
    this.initJsUtility.homeSlide();
    this.initJsUtility.productSlide1();
    this.initJsUtility.imageBackgound();
    this.initJsUtility.logoSlide();
    this.initJsUtility.visitCookie();
  }

}
