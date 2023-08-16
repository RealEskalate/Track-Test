import './App.css';
import { useState, useEffect } from "react"; 
import axios from "axios";

function App() {
  const [currentPage, setCurrentPage] = useState(1); 
  const [find, setFind] = useState(false);
  const [search, setSearch] = useState("");
  const [pages, setPages] = useState([]);
  const postsPerPage = 10;

  function showPost() {
    axios.get("https://jsonplaceholder.typicode.com/posts", {
      params: {
        _page: currentPage,
        _limit: postsPerPage,
        q: search
      }
    })
    .then((response) => {
      setFind(true);
      setPages(response.data);
    })
    .catch((error) => {
      console.log(error);
    });
  }

  useEffect(() => {

    window.history.pushState(null, "", `?page=${currentPage}`);
  }, [currentPage]);

  useEffect(() => {
    
    const params = new URLSearchParams(window.location.search);
    const pageParam = params.get('page');
    if (pageParam) {
      setCurrentPage(Number(pageParam));
    }
  }, []);

  useEffect(() => {
    showPost();
  }, [search, currentPage]); 

  function handleNextPage() {
    setCurrentPage(currentPage + 1);
  }

  function handlePrevPage() {
    if (currentPage > 1) {
      setCurrentPage(currentPage - 1);
    }
  }

  return (
    <div>
      <div>
        <div className='mt-8'>
          <div>
            <input
              className='w-48 bg-gray-200 border-gray-400'
              onChange={(event) => setSearch(event.target.value)}
            />
          </div>
          <button className='bg-red-200 border-r-4 mt-4' onClick={showPost}>
            Search
          </button>
        </div>
        <div>
          {find && (
            <div className="grid grid-flow-row grid-cols-4 gap-2">
              {pages.map(item => (
                <div key={item.id} className="grid-item bg-blue-300">
                  {item.body}
                </div>
              ))}
            </div>
          )}
        </div>
        <div className="pagination">
          <button onClick={handlePrevPage} disabled={currentPage === 1}>
            Previous
          </button>
          <button className="ml-8" onClick={handleNextPage}>Next</button>
        </div>
      </div>
    </div>
  );
}

export default App;
