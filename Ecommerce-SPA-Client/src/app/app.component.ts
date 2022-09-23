import { AfterContentInit, AfterViewInit, Component, ElementRef } from '@angular/core';
import { FunctionUtility } from './_core/utilities/fucntion-utility';

@Component({
  selector: 'body',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements AfterContentInit, AfterViewInit {
  title = 'Ecommerce-SPA-Client';

  constructor(private functionUtility: FunctionUtility, private elementRef: ElementRef) { }
  // add javascripts
  ngAfterContentInit() {
    this.functionUtility.appendScript('../assets/js/vendor/jquery-3.3.1.min.js', this.elementRef);
  }

  ngAfterViewInit() {
    let srcs: string[] = [
      '../assets/js/vendor/modernizr-3.6.0.min.js',
      '../assets/js/vendor/jquery.cookie.js',
      '../assets/js/vendor/wow.min.js',
      '../assets/js/bootstrap.min.js',
      '../assets/js/plugins.js',
      '../assets/js/popper.min.js',
      '../assets/js/lazysizes.js',
      '../assets/js/custom.js'
    ]
    this.functionUtility.appendMultipleScript(srcs, this.elementRef);
  }
  // end add javascrpits
}
