import { createApi, fetchBaseQuery } from "@reduxjs/toolkit/query/react";
import { GetPostsRequest, IPost } from "./types";
export const postsAPI = createApi({
  reducerPath: "postsAPI",
  baseQuery: fetchBaseQuery({
    baseUrl: "https://jsonplaceholder.typicode.com",
  }),
  tagTypes: ["Posts"],
  endpoints: (builder) => ({
    getPosts: builder.query<IPost[], GetPostsRequest>({
      query: (data) => ({
        url: `/posts?_limit=${data._limit}&_page=${data._page}${
          data.q ? `&q=${data.q}` : ""
        }`,
        method: "GET",
      }),

      providesTags: (result, error, id) => [{ type: "Posts", id: "List" }],
    }),
  }),
});

export const { useGetPostsQuery } = postsAPI;
