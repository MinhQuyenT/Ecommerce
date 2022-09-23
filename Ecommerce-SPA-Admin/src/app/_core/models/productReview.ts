export interface ProductReview {
    id: number;
    productId: number;
    customerId: number;
    rating: number | null;
    title: string;
    content: string;
}