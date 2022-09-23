import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

const routes: Routes = [

  {
    path: 'color',
    loadChildren: () => import('./property-color/property-color.module')
      .then((m) => m.PropertyColorModule)
  },
  {
    path: 'size',
    loadChildren: () => import('./property-size/property-size.module')
      .then((m) => m.PropertySizeModule)
  },
  {
    path: 'material',
    loadChildren: () => import('./property-material/property-material.module')
      .then((m) => m.PropertyMaterialModule)
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PropertiesRoutingModule { }
