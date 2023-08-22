import React from 'react';
import { Link } from 'react-router-dom';
import { Button, ButtonGroup } from '@mui/material';
import './pagination.css';

const Pagination = ({ currentPage, totalPages }) => {
  const pageNumbers = Array.from({ length: totalPages }, (_, index) => index + 1);

  return (
    <div className="pagination-container">
      <ButtonGroup color="primary">
        {pageNumbers.map(pageNumber => (
          <Button
            key={pageNumber}
            component={Link}
            to={`?page=${pageNumber}`}
            className={`page-button${currentPage === pageNumber ? ' active' : ''}`}
          >
            {pageNumber}
          </Button>
        ))}
      </ButtonGroup>
    </div>
  );
}

export default Pagination;
