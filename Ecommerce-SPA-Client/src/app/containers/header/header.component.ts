import { Component, OnInit } from '@angular/core';
import { InitJSUtility } from 'src/app/_core/utilities/init-js-utility';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.scss']
})
export class HeaderComponent implements OnInit {

  constructor(
    private initJSUtility: InitJSUtility
  ) { }

  ngOnInit(): void {
    this.initJSUtility.stickyHeader();
    this.initJSUtility.search();
    this.initJSUtility.minicartDrop();
    this.initJSUtility.mobieMenu();
  }

}
