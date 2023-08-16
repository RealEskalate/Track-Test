import React, { useEffect } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import { fetchPosts, setPage, setSearchKeyword } from './store/postsSlice';

function App() {
  const dispatch = useDispatch();
  const posts = useSelector(state => state.posts.posts);
  const currentPage = useSelector(state => state.posts.currentPage);
  const totalPages = useSelector(state => state.posts.totalPages);
  const searchKeyword = useSelector(state => state.posts.searchKeyword);

  useEffect(() => {
    dispatch(fetchPosts());
  }, [dispatch]);

  const handlePageChange = page => {
    dispatch(setPage(page));
    dispatch(fetchPosts());
  };

  const handleSearchChange = event => {
    const keyword = event.target.value;
    dispatch(setSearchKeyword(keyword));
    dispatch(fetchPosts());
  };

  return (
    <div>
      <input type="text" value={searchKeyword} onChange={handleSearchChange} placeholder="Search posts" />
      <ul>
        {posts.map(post => (
          <li key={post.id}>
            <h2>{post.title}</h2>
            <p>{post.body}</p>
            <hr/>
          </li>
        ))}
      </ul>
      <div>
        {Array.from({ length: totalPages }, (_, index) => (
          <button
            key={index}
            onClick={() => handlePageChange(index + 1)}
            style={{ fontWeight: currentPage === index + 1 ? 'bold' : 'normal' }}
          >
            {index + 1}
          </button>
        ))}
      </div>
    </div>
  );
}

export default App;