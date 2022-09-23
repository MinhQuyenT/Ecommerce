export interface AdminCoreRole {
  roleUnique: string;
  roleName: string;
  roleType: string;
  roleNote: string;
  roleSequence: number;
  url: string;
  routing: string;
  parentId: string;
  children: AdminCoreRole[]
}