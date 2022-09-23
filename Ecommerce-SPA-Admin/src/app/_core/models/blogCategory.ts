export interface BlogCategory {
    id: number;
    name: string;
    url: string;
    status: boolean | null;
    createBy: string;
    createTime: string;
    updateBy: string;
    updateTime: string | null;
}