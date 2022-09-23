export interface Product {
    id: number;
    code: string;
    title: string;
    description: string;
    avartar: string;
    thumb: string;
    content: string;
    imageList: string;
    price: number;
    oldPrice: number | null;
    promotion: string;
    isHot: boolean | null;
    isSale: boolean | null;
    isNew: boolean | null;
    quantity: number;
    status: boolean | null;
    productCategoryId: number;
    createBy: string;
    createTime: string;
    updateBy: string;
    updateTime: string | null;
}