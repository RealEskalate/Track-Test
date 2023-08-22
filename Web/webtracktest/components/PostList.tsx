
import React, { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { fetchPosts, selectPosts, selectLoading, selectError } from '../store/postsSlice';
import { RootState } from '../store/store'; // Make sure to adjust the path to your store file
import { Action } from 'redux'; // Import the Action type

const PostList: React.FC<{currentPage: number; searchQuery: string}> = ({
    currentPage,
    searchQuery
}) => {
  const dispatch = useDispatch();
  const posts = useSelector(selectPosts);
  const loading = useSelector(selectLoading);
  const error = useSelector(selectError);

  useEffect(() => {
    dispatch(fetchPosts());
  }, [dispatch]);

  if (loading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return <p>Error: {error}</p>;
  }

  return (
    <div>
      {posts.map((post) => (
        <div key={post.id}>
          <h2>{post.title}</h2>
          <p>{post.body}</p>
        </div>
      ))}
    </div>
  );
};

export default PostList;
