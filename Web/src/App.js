
// const debounceFun = (func, delay) => {
//   let timer;

//   return function(...args){
//     clearTimeout(timer);
//     timer = setTimeout(() => {
//       func.apply(this, args)
//     }, delay)
//   }
// }

import React, { useEffect, useState } from 'react';
import axios from 'axios';

const App = () => {
  const [posts, setPosts] = useState([]);
  const [currentPage, setCurrentPage] = useState(1);
  const [keyWord, setKeyWord] = useState("");

  useEffect(() => {
    const fetchPosts = async () => {
      try {
        const response = await axios.get(
          `https://jsonplaceholder.typicode.com/posts?_limit=10&_page=${currentPage}`
        );
        setPosts(response.data);
      } catch (error) {
        console.log(error);
      }
    };

    fetchPosts();
  }, [currentPage]);

  const nextPage = () => {
    setCurrentPage((prevPage) => prevPage + 1);
  };

  const prevPage = () => {
    if (currentPage > 1) {
      setCurrentPage((prevPage) => prevPage - 1);
    }
  };

  const search = () => {
    const fetchPosts = async () => {
      try {
        const response = await axios.get(
          `https://jsonplaceholder.typicode.com/posts?_limit=10&_page=${currentPage}`
        );
        setPosts(response.data);
      } catch (error) {
        console.log(error);
      }
    }
  }

  return (
    <div>
      <h1>Posts</h1>
      <input placeholder='Search' onChange={(e) => {
        setKeyWord(e.target.value)
      }}
      value={keyWord} />
      <ul>
        {posts.map((post) => (
          <li key={post.id}>
            <h3>{post.title}</h3>
            <p>{post.body}</p>
          </li>
        ))}
      </ul>
      <div>
        <button onClick={prevPage} disabled={currentPage === 1}>
          Previous Page
        </button>
        <button onClick={nextPage}>Next Page</button>
      </div>
    </div>
  );
};

export default App;