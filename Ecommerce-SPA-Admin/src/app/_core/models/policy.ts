export interface Policy {
    id: number;
    name: string;
    content: string;
    status: boolean | null;
    createBy: string;
    createTime: string;
    updateBy: string;
    updateTime: string | null;
}