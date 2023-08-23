
import { useState } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { fetchPostsStart, fetchPostsSuccess } from '../store/postsSlice';
import { RootState } from '../store/store';
import axios from 'axios';

export default function Home() {
  const dispatch = useDispatch();
  const posts = useSelector((state: RootState) => state.posts.posts);
  const loading = useSelector((state: RootState) => state.posts.loading);

  const [currentPage, setCurrentPage] = useState(1);
  const [searchQuery, setSearchQuery] = useState('');

  const fetchPosts = async (page: number, query: string) => {
    dispatch(fetchPostsStart());
    try {
      const response = await axios.get(
        `https://jsonplaceholder.typicode.com/posts?_page=${page}&q=${query}`
      );
      dispatch(fetchPostsSuccess(response.data));
    } catch (error) {
      console.error('Error fetching posts:', error);
    }
  };

  const handleSearch = (query: string) => {
    setSearchQuery(query);
    setCurrentPage(1);
    fetchPosts(1, query);
  };

  const handlePageChange = (page: number) => {
    setCurrentPage(page);
    fetchPosts(page, searchQuery);
  };

  return (
    <div className="container mx-auto p-4">
      <h1 className="text-2xl font-bold mb-4 text-blue-700">Posts</h1>
      <input
        type="text"
        placeholder="Search"
        className="border p-2 mb-4 text-black rounded-lg"
        value={searchQuery}
        onChange={(e) => handleSearch(e.target.value)}
      />
      {loading ? (
        <p>Loading...</p>
      ) : (
        <div>
          <ul>
            {posts.map((post) => (
              <li key={post.id} className="mb-3 border-l-4 border-l-blue-500 rounded">
                <div className='flex text-lg font-semibold gap-2 text-blue-500'>
                  <h2>{post.id}</h2>
                  <h2>{post.title}</h2>
                </div>
                
                <p className='text-gray-500'>{post.body}</p>
                {/* </div> */}
              </li>
            ))}
          </ul>
          <div className="mt-4">
            {Array.from({ length: Math.ceil(posts.length) }).map(
              (_, index) => (
                <button
                  key={index}
                  className={`mr-2 px-2 py-1 border rounded-lg ${
                    currentPage === index + 1 ? 'bg-blue-700' : ''
                  }`}
                  onClick={() => handlePageChange(index + 1)}
                >
                  {index + 1}
                </button>
              )
            )}
          </div>
        </div>
      )}
    </div>
  );
}
