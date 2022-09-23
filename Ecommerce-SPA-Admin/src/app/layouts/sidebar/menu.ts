import { Injectable } from '@angular/core';
import { LocalStorageConstant } from '@constants/local-storage.constant';
import { MenuItem } from './menu.model';
import { UserForLogged } from '@models/auth/userForLogged';
import { AdminCoreRole } from '@models/auth/adminCoreRole';

@Injectable()
export class MenuGetter {
  getMenu(): MenuItem[] {
    let result: MenuItem[] = [];
    let user: UserForLogged = JSON.parse(localStorage.getItem(LocalStorageConstant.USER));

    if (!user)
      return [];

    let roles: AdminCoreRole[] = user.roles;
    result = this.getRoleChildren([...roles], null);
    result.forEach((x: MenuItem) => {
      x.subItems = this.getRoleChildren([...roles], x.id);
      x.subItems.forEach((y: MenuItem) => {
        y.subItems = this.getRoleChildren([...roles], y.id);
      })
    });
    return result;
  }

  private getRoleChildren(roles: AdminCoreRole[], roleUnique: string): MenuItem[] {
    return roles
      .filter(x => x.parentId == roleUnique)
      .map(x => <MenuItem>{
        id: x.roleUnique,
        label: x.roleName,
        link: x.url + x.routing,
        icon: x.roleNote,
        parentId: roleUnique
      });
  }
}
