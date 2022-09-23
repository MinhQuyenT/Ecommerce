import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AdminUserAuthorizeResolver } from '@resolvers/admin-user/admin-user-authorize.resolver';
import { AdminUserEditResolver } from '@resolvers/admin-user/admin-user-edit.resolver';
import { AdminUserResolver } from '@resolvers/admin-user/admin-user.resolver';
import { AddComponent } from './add/add.component';
import { AuthorizeComponent } from './authorize/authorize.component';
import { EditComponent } from './edit/edit.component';
import { MainComponent } from './main/main.component';

const routes: Routes = [
  {
    path: '',
    resolve: { res: AdminUserResolver },
    component: MainComponent,
  },
  {
    path: 'add',
    component: AddComponent,
  },
  {
    path: 'edit/:userAccount',
    resolve: { res: AdminUserEditResolver },
    component: EditComponent
  },
  {
    path: 'authorize/:userAccount',
    resolve: { res: AdminUserAuthorizeResolver },
    component: AuthorizeComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AdminUserRoutingModule { }
