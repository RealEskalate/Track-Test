import React from 'react';
import { Link } from 'react-router-dom';

const PostList = ({ posts }) => {
  return (
    <ol>
      {posts.map((post) => (
        <li key={post.id} className="mb-2 border-b-2 shadow p-2 ">
          <Link to={`/post/${post.id}`} className="text-blue-500 hover:underline">
            {post.title}
          </Link>
        </li>
      ))}
    </ol>
  );
};

export default PostList;
