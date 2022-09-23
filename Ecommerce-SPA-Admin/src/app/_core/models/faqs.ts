export interface Faqs {
    id: number;
    question: string;
    answer: string;
    status: boolean | null;
    createBy: string;
    createTime: string;
    policyId: number;
}