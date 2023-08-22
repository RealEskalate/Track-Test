import React from "react";
import { IPost } from "../../features/posts/types";
interface PostProps {
  post: IPost;
}
function Post({ post }: PostProps) {
  return (
    <div className="w-full rounded-md shadow bg-white flex flex-col gap-3 items-start p-2">
      <div className="font-semibold text-lg">{post.title}</div>
      <div className="font-normal text-base">{post.body}</div>
    </div>
  );
}

export default Post;
