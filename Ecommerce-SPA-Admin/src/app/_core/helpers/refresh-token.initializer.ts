import { AdminAuthService } from "@services/admin-auth.service";

export function refreshTokenInitializer(adminAuthService: AdminAuthService) {
  return () => new Promise(resolve => adminAuthService.refreshToken().subscribe({ complete: () => resolve(null) }));
}