export interface IPost {
  userId: number;
  id: number;
  title: string;
  body: string;
}

export interface GetPostsRequest {
  _limit: number;
  _page: number;
  q?: string;
}