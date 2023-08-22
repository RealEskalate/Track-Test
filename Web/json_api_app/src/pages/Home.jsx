import React,{useEffect} from 'react'
import SearchBar from '../components/SearchBar'
import PostList from '../components/PostList'
import PostDetail from '../components/PostDetail'
import Pagination from '../components/Pagination'
import { useSelector, useDispatch } from 'react-redux';
import { fetchPosts, selectAllPosts, selectPostsStatus } from '../redux/slices'
import {useLocation} from 'react-router-dom'
// import { useSelector, useDispatch } from 'react-redux';


function Home() {
  // const dispatch = useDispatch();
  // useEffect(() => {
  //   dispatch(fetchPosts({ _limit: 10, _page: 1 }));
  // }, [dispatch]);

const posts = useSelector(selectAllPosts);
const location = useLocation();
  const searchQuery = new URLSearchParams(location.search).get('q');
  const filteredPosts = searchQuery
    ? posts.filter((post) =>
        post.title.toLowerCase().includes(searchQuery.toLowerCase())
      )
    : posts;

  



  return (
    <div>
        <SearchBar />
        <PostList  posts={filteredPosts} />
        <Pagination />
    </div>
  )
}

export default Home