import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LookbookComponent } from './lookbook/lookbook.component';

const routes: Routes = [
  {
    path: '',
    data: {
      title: 'LookBook'
    },
    component: LookbookComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LookbookRoutingModule { }
