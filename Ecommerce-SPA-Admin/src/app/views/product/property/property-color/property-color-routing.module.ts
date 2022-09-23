import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PropertyColorMainComponent } from './property-color-main/property-color-main.component';

const routes: Routes = [
  {
    path: '',
    component: PropertyColorMainComponent,
    data: {
      title: 'Main'
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PropertyColorRoutingModule { }
