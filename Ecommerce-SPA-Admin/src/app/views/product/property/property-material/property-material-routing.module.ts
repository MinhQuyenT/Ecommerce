import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PropertyMaterialMainComponent } from './property-material-main/property-material-main.component';

const routes: Routes = [
  {
    path: '',
    component: PropertyMaterialMainComponent,
    data: {
      title: 'Main'
    }
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PropertyMaterialRoutingModule { }
