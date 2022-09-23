import { LocationStrategy, PathLocationStrategy } from '@angular/common';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { DefaultLayoutComponent } from './containers';
import { AkitaNgDevtools } from '@datorama/akita-ngdevtools';
import { AkitaNgRouterStoreModule } from '@datorama/akita-ng-router-store';
import { environment } from '../environments/environment';
import { TopHeaderComponent } from './containers/top-header/top-header.component';
import { MobieMenuComponent } from './containers/mobie-menu/mobie-menu.component';
import { FooterComponent } from './containers/footer/footer.component';
import { QuickViewComponent } from './containers/quick-view/quick-view.component';
import { NewsletterComponent } from './containers/newsletter/newsletter.component';
import { HeaderComponent } from './containers/header/header.component';
import { MiniCartComponent } from './containers/mini-cart/mini-cart.component';
import { DesktopMenuComponent } from './containers/desktop-menu/desktop-menu.component';


const APP_CONTAINERS = [
  DefaultLayoutComponent,
  TopHeaderComponent,
  MobieMenuComponent,
  FooterComponent,
  QuickViewComponent,
  NewsletterComponent,
  HeaderComponent,
  MiniCartComponent,
  DesktopMenuComponent
];

@NgModule({
  declarations: [
    AppComponent,
    ...APP_CONTAINERS
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    environment.production ? [] : AkitaNgDevtools.forRoot(),
    AkitaNgRouterStoreModule
  ],
  providers: [
    {
      provide: LocationStrategy,
      useClass: PathLocationStrategy
    },
  ],
  schemas: [
    CUSTOM_ELEMENTS_SCHEMA
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
