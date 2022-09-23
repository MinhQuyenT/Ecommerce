export interface Menu {
    menuID: number;
    text: string;
    link: string;
    displayOrder: number | null;
    target: string;
    status: boolean | null;
    menuTypeID: number;
    menuParentID: number;
}