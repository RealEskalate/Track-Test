const Pagination = ({ currentPage, totalPages }) => {
    const pageNumbers = Array.from({ length: totalPages }, (_, index) => index + 1);
  
    return (
      <div>
        {pageNumbers.map(pageNumber => (
          <a
            key={pageNumber}
            href={`?page=${pageNumber}`}
            style={{ margin: '0.2rem' }}
          >
            {pageNumber}
          </a>
        ))}
      </div>
    );
  }
  
  export default Pagination;