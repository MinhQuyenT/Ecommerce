import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { AdminAuthService } from '@services/admin-auth.service';

@Injectable({
  providedIn: 'root'
})
export class AdminAuthGuard {
  constructor(
    private adminAuthService: AdminAuthService,
    private router: Router) { }

  canActivate(): boolean {
    if (this.adminAuthService.loggedIn()) {
      return true;
    }
    else {
      this.router.navigate(['/login']);
      return false;
    }
  }
}
