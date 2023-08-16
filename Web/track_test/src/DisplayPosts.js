import React, { useState, useEffect } from 'react';
import { useLocation, useNavigate } from 'react-router-dom';
import Pagination from './Pagination';
import fetchData from './FetchData';

const DisplayPosts = () => {
  const [posts, setPosts] = useState([]);
  const [searchKeyword, setSearchKeyword] = useState('');
  const [filteredPosts, setFilteredPosts] = useState([]);

  const location = useLocation();
  const navigate = useNavigate();

  const queryParams = new URLSearchParams(location.search);
  const currentPage = parseInt(queryParams.get('page')) || 1;
  const postsPerPage = 10;

  useEffect(() => {
    fetchData()
      .then(jsonData => {
        setPosts(jsonData);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  useEffect(() => {
    // Filter posts based on searchKeyword
    const filtered = posts.filter(post =>
      post.title.toLowerCase().includes(searchKeyword.toLowerCase()) ||
      post.body.toLowerCase().includes(searchKeyword.toLowerCase())
    );
    setFilteredPosts(filtered);
  }, [searchKeyword, posts]);

  useEffect(() => {
    // Update URL with searchKeyword
    const newSearchParams = new URLSearchParams(queryParams);
    newSearchParams.set('page', currentPage);
    newSearchParams.set('search', searchKeyword);
    navigate(`?${newSearchParams.toString()}`, { replace: true });
  }, [currentPage, navigate, searchKeyword]);

  const startIndex = (currentPage - 1) * postsPerPage;
  const displayedPosts = filteredPosts.slice(startIndex, startIndex + postsPerPage);

  return (
    <div>
      <h1>Posts</h1>
      <input
        type="text"
        placeholder="Search posts..."
        value={searchKeyword}
        onChange={e => setSearchKeyword(e.target.value)}
      />
      {displayedPosts.map(post => (
        <div key={post.id}>
          <h2>{post.title}</h2>
          <p>{post.body}</p>
        </div>
      ))}

      <Pagination
        currentPage={currentPage}
        totalPages={Math.ceil(filteredPosts.length / postsPerPage)}
      />
    </div>
  );
}

export default DisplayPosts;
