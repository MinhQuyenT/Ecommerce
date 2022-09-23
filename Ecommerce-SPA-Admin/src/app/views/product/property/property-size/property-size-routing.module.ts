import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PropertySizeResolver } from '@resolvers/properties/property-size.resolver';
import { PropertySizeAddComponent } from './property-size-add/property-size-add.component';
import { PropertySizeEditComponent } from './property-size-edit/property-size-edit.component';
import { PropertySizeMainComponent } from './property-size-main/property-size-main.component';

const routes: Routes = [
  {
    path: '',
    component: PropertySizeMainComponent,
    data: {
      title: 'Main'
    }
  },
  {
    path: 'add',
    component: PropertySizeAddComponent,
    data: {
      title: 'Add'
    },
  },
  {
    path: 'edit/:id',
    component: PropertySizeEditComponent,
    resolve: { size: PropertySizeResolver },
    data: {
      title: 'Edit'
    },
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PropertySizeRoutingModule { }
