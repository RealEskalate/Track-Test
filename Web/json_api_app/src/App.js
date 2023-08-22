import  { useEffect,useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import {BrowserRouter as Router, Route,Routes,Navigate} from 'react-router-dom'
import { fetchPosts, selectAllPosts, selectPostsStatus } from './redux/slices'
import PostDetail from './components/PostDetail';
import Home from './pages/Home';
import HourglassBottomIcon from '@mui/icons-material/HourglassBottom';

function App() {
  const dispatch = useDispatch();


  const status = useSelector(selectPostsStatus);

  useEffect(() => {
    dispatch(fetchPosts({ _limit: 10, _page: 1 }));
  }, [dispatch]);

  if (status === 'loading') {
    return <div class = ' m-auto '> < HourglassBottomIcon style ={{color: 'blue'}} /> Loading...</div>;
  }

  return (
    <Router>
      <div className="container mx-auto p-4">
        <h1 className="text-2xl font-bold mb-4 bg-gray-200 rounded p-2 ">JSON API Posts</h1>
        <Routes>
          <Route path="/post/:postId" element={<PostDetail />} />
          <Route path="/" exact element = {< Home  />} />
        </Routes>
      </div>
    </Router>
  );
}

export default App;
