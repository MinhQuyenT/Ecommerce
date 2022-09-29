import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { BlogDetailComponent } from './blog-detail/blog-detail.component';
import { BlogMainComponent } from './blog-main/blog-main.component';

const routes: Routes = [
  {
    path: '',
    component: BlogMainComponent
  },
  {
    path: 'detail',
    component: BlogDetailComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class BlogRoutingModule { }
