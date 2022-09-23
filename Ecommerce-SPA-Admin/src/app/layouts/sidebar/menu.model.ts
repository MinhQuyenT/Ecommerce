export interface MenuItem {
  id?: string;
  label?: string;
  icon?: string;
  link?: string;
  subItems?: any;
  isTitle?: boolean;
  badge?: any;
  parentId?: string;
  isLayout?: boolean;
}
