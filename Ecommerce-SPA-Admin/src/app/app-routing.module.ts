import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { LayoutComponent } from './layouts/layout.component';
import { Page404Component } from './views/page404/page404.component';
import { DashboardComponent } from './views/dashboard/dashboard.component';
import { LoginComponent } from './views/login/login.component';
import { AdminAuthGuard } from '@guards/admin-auth.guard';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'dashboard',
    pathMatch: 'full'
  },
  {
    path: '404',
    component: Page404Component
  },
  {
    path: 'login',
    component: LoginComponent
  },
  {
    path: '', component: LayoutComponent,
    canActivate: [AdminAuthGuard],
    children: [
      {
        path: 'dashboard',
        component: DashboardComponent,
      },
      {
        path: 'user',
        loadChildren: () => import('./views/User/user.module').then(m => m.UserModule)
      },
      {
        path: 'product',
        loadChildren: () => import('./views/product/product.module').then(m => m.ProductModule)
      },
      {
        path:'banner',
        loadChildren:()=>import('./views/banner/banner.module').then(m=>m.BannerModule)
      },
      {
        path:'contact',
        loadChildren:()=>import('./views/contact/contact.module').then(m=>m.ContactModule)
      }
    ]
  },
  {
    path: '**',
    redirectTo: '404'
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { scrollPositionRestoration: 'top', relativeLinkResolution: 'legacy' })],
  exports: [RouterModule]
})

export class AppRoutingModule { }
