import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { APP_INITIALIZER, Injector, NgModule } from '@angular/core';
import { HttpClientModule, HttpClient, HTTP_INTERCEPTORS } from '@angular/common/http';
import { NgbNavModule, NgbAccordionModule, NgbTooltipModule, NgbModule, NgbModal, NgbModalModule } from '@ng-bootstrap/ng-bootstrap';
import { CarouselModule } from 'ngx-owl-carousel-o';
import { ScrollToModule } from '@nicky-lenaers/ngx-scroll-to';
import { LayoutsModule } from './layouts/layouts.module';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { TranslateModule, TranslateLoader, TranslateService } from '@ngx-translate/core';
import { TranslateHttpLoader } from '@ngx-translate/http-loader';
import { DashboardComponent } from './views/dashboard/dashboard.component';
import { Page404Component } from './views/page404/page404.component';
import { AkitaNgDevtools } from '@datorama/akita-ngdevtools';
import { AkitaNgRouterStoreModule } from '@datorama/akita-ng-router-store';
import { environment } from '../environments/environment';
import { FormsModule } from '@angular/forms';
import { GlobalHttpInterceptor } from '@utilities/global-http-interceptor';
import { SnotifyModule, SnotifyService, ToastDefaults } from 'ng-snotify';
import { NgxSpinnerModule } from 'ngx-spinner';
import { LoginComponent } from './views/login/login.component';
import { AdminAuthGuard } from '@guards/admin-auth.guard';
import { ngxTranslateInitializer } from '@helpers/ngx-translate.initializer';
import { JwtModule } from '@auth0/angular-jwt';
import { LocalStorageConstant } from '@constants/local-storage.constant';
import { refreshTokenInitializer } from '@helpers/refresh-token.initializer';
import { AdminAuthService } from '@services/admin-auth.service';
import { ModalModule } from 'ngx-bootstrap/modal';
import { CommonModule } from '@angular/common';

export function createTranslateLoader(http: HttpClient): any {
  return new TranslateHttpLoader(http, 'assets/i18n/', '.json');
}

@NgModule({
  declarations: [
    AppComponent,
    DashboardComponent,
    Page404Component,
    LoginComponent
  ],
  imports: [
    // CommonModule,
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    FormsModule,
    TranslateModule.forRoot({
      loader: {
        provide: TranslateLoader,
        useFactory: createTranslateLoader,
        deps: [HttpClient]
      }
    }),
    LayoutsModule,
    AppRoutingModule,
    CarouselModule,
    NgbAccordionModule,
    NgbNavModule,
    NgbTooltipModule,
    ScrollToModule.forRoot(),
    NgbModule,
    environment.production ? [] : AkitaNgDevtools.forRoot(),
    AkitaNgRouterStoreModule,
    SnotifyModule,
    NgxSpinnerModule,
    CarouselModule,
    FormsModule,
    JwtModule.forRoot({
      config: {
        tokenGetter: tokenGetter,
        allowedDomains: environment.allowedDomains,
        disallowedRoutes: environment.disallowedRoutes,
      },
    }),
  ],
  bootstrap: [AppComponent],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: GlobalHttpInterceptor,
      multi: true,
    },
    {
      provide: 'SnotifyToastConfig',
      useValue: ToastDefaults
    },
    {
      provide: APP_INITIALIZER,
      useFactory: ngxTranslateInitializer,
      deps: [TranslateService, Injector],
      multi: true
    },
    {
      provide: APP_INITIALIZER,
      useFactory: refreshTokenInitializer,
      multi: true,
      deps: [AdminAuthService]
    },
    SnotifyService,
    AdminAuthGuard
  ]
})
export class AppModule { }

export function tokenGetter() {
  return localStorage.getItem(LocalStorageConstant.TOKEN);
}
