export interface Contact {
    id: number;
    name: string;
    phone: string;
    email: string;
    address: string;
    content: string;
    status: boolean | null;
    createBy: string;
    createTime: string;
    updateBy: string;
    updateTime: string | null;
}