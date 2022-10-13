import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CustomerComponent } from './main/customer.component';

const routes: Routes = [
  {
    path:'',
    component:CustomerComponent,
    data:{
      title: 'Customer List'
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class CustomerRoutingModule { }
