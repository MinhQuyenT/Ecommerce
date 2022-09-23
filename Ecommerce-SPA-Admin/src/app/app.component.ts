import { Component, OnInit } from '@angular/core';
import {
  Router,
  Event as RouterEvent,
  NavigationEnd,
  NavigationStart,
  NavigationCancel,
  NavigationError
} from '@angular/router';
import '@utilities/extension-methods';
import { NgxSpinnerService } from 'ngx-spinner';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {

  constructor(
    private router: Router,
    private spinnerService: NgxSpinnerService) { }

  ngOnInit() {
    this.router.events.subscribe((evt) => {
      this.navigationInterceptor(evt);
      if (!(evt instanceof NavigationEnd)) {
        return;
      }
      window.scrollTo(0, 0);
    });
  }

  navigationInterceptor(e: RouterEvent) {
    if (e instanceof NavigationStart) {
      this.spinnerService.show();
    }

    if (e instanceof NavigationEnd || e instanceof NavigationCancel || e instanceof NavigationError) {
      this.spinnerService.hide();
    }
  }
}
