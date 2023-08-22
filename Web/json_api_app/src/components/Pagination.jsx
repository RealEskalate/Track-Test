import React from 'react';
import { useSelector } from 'react-redux';
import { selectAllPosts } from '../redux/slices';
import { useLocation, useNavigate } from 'react-router-dom';
import ArrowRightAltIcon from '@mui/icons-material/ArrowRightAlt';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';


const Pagination = () => {
  const navigate = useNavigate(); // Use useNavigate hook
  const location = useLocation();
  const posts = useSelector(selectAllPosts);
  console.log('posts',posts);


  const currentPage = Number(new URLSearchParams(location.search).get('_page')) || 1;
  const itemsPerPage = 10;
  const totalPosts = posts.length;
  const totalPages = Math.ceil(totalPosts / itemsPerPage);

  const startIndex = (currentPage - 1) * itemsPerPage;
  const endIndex = Math.min(startIndex + itemsPerPage, totalPosts);

  const goToPage = (page) => {
    navigate(`${location.pathname}?_page=${page}`);
  };

  const goToNextPage = () => {

    if (currentPage < totalPages) {
      goToPage(currentPage + 1);
    }
  };

  const goToPreviousPage = () => {
    if (currentPage > 1) {
      goToPage(currentPage - 1);
    }
  };

  return (
    <div className="flex justify-center my-4">
      <button
        onClick={goToPreviousPage}
        disabled={currentPage === 1}
        className="px-2 py-1 mx-1 bg-gray-300 cursor-pointer"
      >
        <ArrowBackIcon />
      </button>
      {Array.from({ length: totalPages }, (_, index) => (
        <button
          key={index}
          onClick={() => goToPage(index + 1)}
          className={`px-2 py-1 mx-1 ${
            currentPage === index + 1 ? 'bg-blue-500 text-white' : 'bg-gray-300'
          }`}
        >
          {index + 1}
        </button>
      ))}
      <button
        onClick={goToNextPage}
        disabled={currentPage === totalPages}
        className="px-2 py-1 mx-1 bg-gray-300 cursor-pointer"
      >
        <ArrowRightAltIcon />
      </button>
    </div>
  );
};

export default Pagination;
