export interface ProductCategory {
    id: number;
    code: string;
    name_vi: string;
    name_en: string;
    title: string;
    description: string;
    avartar: string;
    status: boolean | null;
    thumb: string;
    url: string;
    createBy: string;
    createTime: string;
    updateBy: string;
    updateTime: string | null;
}