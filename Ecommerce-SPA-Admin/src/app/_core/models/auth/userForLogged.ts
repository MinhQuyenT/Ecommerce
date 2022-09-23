import { AdminCoreRole } from "./adminCoreRole";

export interface UserForLogged {
  userAccount: string;
  username: string;
  roles: AdminCoreRole[];
}