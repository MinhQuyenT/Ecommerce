export interface BlogTag {
    id: number;
    blogId: number;
    name: string;
    status: boolean | null;
    createBy: string;
    createTime: string;
    updateBy: string;
    updateTime: string | null;
}