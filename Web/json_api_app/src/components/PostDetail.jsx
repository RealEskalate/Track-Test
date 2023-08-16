import React from 'react';
import { useSelector } from 'react-redux';
import { useParams } from 'react-router-dom';
import { selectPostById } from '../redux/slices';

const PostDetail = () => {
  const { postId } = useParams();
  const post = useSelector((state) => selectPostById(state, parseInt(postId)));

  if (!post) {
    return <div>Post not found</div>;
  }

  return (
    <div>
      <h2 className="text-2xl font-bold mb-4">{post.title}</h2>
      <p>{post.body}</p>
    </div>
  );
};

export default PostDetail;
