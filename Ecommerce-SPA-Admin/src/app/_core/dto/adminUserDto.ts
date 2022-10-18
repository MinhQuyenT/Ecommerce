export interface AdminUserDto {
  userAccount: string;
  password: string;
  userName: string;
  email: string;
  validFrom: string | any;
  validTo: string | any;
  lastLogin: string | null;
  updateBy: string;
  updateTime: string | null;
}