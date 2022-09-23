import { AdminRole } from '@models/adminRole';

export interface UserAuthorize extends AdminRole {
  userAccount: string;
  status: boolean;
  children: UserAuthorize[]
}