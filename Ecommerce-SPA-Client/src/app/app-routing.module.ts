import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { DefaultLayoutComponent } from './containers/default-layout/default-layout.component';

const routes: Routes = [
  {
    path: '',
    redirectTo: 'home',
    pathMatch: 'full'
  },
  {
    path: '',
    component: DefaultLayoutComponent,
    data: {
      title: 'Home'
    },
    children: [
      {
        path: 'home',
        loadChildren: () => import("./views/home/home.module").then(m => m.HomeModule)
      },
      {
        path: 'collection',
        loadChildren: () => import("./views/collection/collection.module").then(m => m.CollectionModule)
      },
      {
        path: 'shop',
        loadChildren: () => import("./views/shop/shop.module").then(m => m.ShopModule)
      },
      {
        path: 'lookbook',
        loadChildren: () => import("./views/lookbook/lookbook.module").then(m => m.LookbookModule)
      },
      {
        path: 'faqs',
        loadChildren: () => import("./views/faqs/faqs.module").then(m => m.FaqsModule)
      },
      {
        path: 'about-us',
        loadChildren: () => import("./views/about-us/about-us.module").then(m => m.AboutUsModule)
      },
      {
        path: 'contact-us',
        loadChildren: () => import("./views/contact-us/contact-us.module").then(m => m.ContactUsModule)
      },
      {
        path: 'product',
        loadChildren: () => import("./views/product/product.module").then(m => m.ProductModule)
      },
      {
        path: 'wishlist',
        loadChildren: () => import("./views/wishlist/wishlist.module").then(m => m.WishlistModule)
      },
      {
        path: 'blog',
        loadChildren: () => import("./views/blog/blog.module").then(m => m.BlogModule)
      },
      {
        path: 'cart',
        loadChildren: () => import("./views/cart/cart.module").then(m => m.CartModule)
      },
      {
        path: 'checkout',
        loadChildren: () => import("./views/checkout/checkout.module").then(m => m.CheckoutModule)
      },
      {
        path: 'login',
        loadChildren: () => import("./views/login/login.module").then(m => m.LoginModule)
      },
      {
        path: 'register',
        loadChildren: () => import("./views/register/register.module").then(m => m.RegisterModule)
      }
    ]
  },
  { path: '**', redirectTo: 'home', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { relativeLinkResolution: 'legacy'})],
  exports: [RouterModule]
})
export class AppRoutingModule { }
