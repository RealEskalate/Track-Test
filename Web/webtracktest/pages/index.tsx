
import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchPosts, selectPosts, selectLoading, selectError } from '../store/postsSlice';
import Pagination from '../components/Pagination';
import SearchBar from '../components/SearchBar';
import { useRouter } from 'next/router';

const ITEMS_PER_PAGE = 10;

const HomePage: React.FC = () => {
  const dispatch = useDispatch();
  const posts = useSelector(selectPosts);
  const loading = useSelector(selectLoading);
  const error = useSelector(selectError);
  const router = useRouter();

  const { _page, q } = router.query;

  useEffect(() => {
    dispatch(fetchPosts({ _limit: ITEMS_PER_PAGE, _page, q }));
  }, [dispatch, _page, q]);

  const handlePageChange = (page: number) => {
    router.push({
      pathname: '/',
      query: { ...router.query, _page: page },
    });
  };

  const handleSearch = (query: string) => {
    router.push({
      pathname: '/',
      query: { ...router.query, _page: 1, q: query },
    });
  };

  if (loading) {
    return <p>Loading...</p>;
  }

  if (error) {
    return <p>Error: {error}</p>;
  }

  return (
    <div>
      <h1 className="text-2xl font-bold mb-4">Posts</h1>
      <SearchBar onSearch={handleSearch} />
      {posts.map((post) => (
        <div key={post.id} className="mb-4 p-4 border rounded">
          <h2 className="text-lg font-semibold">{post.title}</h2>
          <p>{post.body}</p>
        </div>
      ))}
      <Pagination
        currentPage={parseInt(_page as string, 10) || 1}
        totalPages={10} 
        onPageChange={handlePageChange}
      />
    </div>
  );
};

export default HomePage;
