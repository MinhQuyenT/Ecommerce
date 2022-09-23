import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { AdminUserRoutingModule } from './admin-user-routing.module';
import { MainComponent } from './main/main.component';
import { AddComponent } from './add/add.component';
import { EditComponent } from './edit/edit.component';
import { AuthorizeComponent } from './authorize/authorize.component';
import { TranslateModule } from '@ngx-translate/core';
import { AdminUserResolver } from '@resolvers/admin-user/admin-user.resolver';
import { UIModule } from 'src/app/shared/ui/ui.module';
import { FormsModule } from '@angular/forms';
import { NgbDatepickerModule, NgbPaginationModule } from '@ng-bootstrap/ng-bootstrap';
import { AdminUserEditResolver } from '@resolvers/admin-user/admin-user-edit.resolver';
import { AdminUserAuthorizeResolver } from '@resolvers/admin-user/admin-user-authorize.resolver';
import { TreeviewModule } from 'ngx-treeview';


@NgModule({
  declarations: [
    MainComponent,
    AddComponent,
    EditComponent,
    AuthorizeComponent
  ],
  imports: [
    CommonModule,
    TranslateModule,
    AdminUserRoutingModule,
    UIModule,
    FormsModule,
    NgbDatepickerModule,
    TreeviewModule.forRoot(),
    NgbPaginationModule,
  ],
  providers: [
    AdminUserResolver,
    AdminUserEditResolver,
    AdminUserAuthorizeResolver
  ]
})
export class AdminUserModule { }
