import React from 'react';
import { useSelector } from 'react-redux';
import { selectAllPosts } from '../redux/slices';
import { useLocation, useNavigate } from 'react-router-dom';
import ArrowRightAltIcon from '@mui/icons-material/ArrowRightAlt';

const Pagination = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const posts = useSelector(selectAllPosts);

  const currentPage = Number(new URLSearchParams(location.search).get('_page')) || 1;
  const itemsPerPage = 10;
  const totalPosts = posts.length;
  const totalPages = Math.ceil(totalPosts / itemsPerPage);

  const startIndex = (currentPage - 1) * itemsPerPage;
  const endIndex = Math.min(startIndex + itemsPerPage, totalPosts);

  const goToPage = (page) => {
    navigate(`${location.pathname}?_page=${page}`)
  };

  return (
    <div className="flex justify-center my-4">
      {Array.from({ length: totalPages }, (_, index) => (
        <button
          key={index}
          onClick={() => goToPage(index + 1)}
          className={`px-2 py-1 mx-1 ${
            currentPage === index + 1 ? 'bg-blue-500 text-white' : 'bg-gray-300'
          }`}
        >
          <ArrowRightAltIcon /> {index + 1}
        </button>
      ))}
    </div>
  );
};

export default Pagination;
