// import React from 'react';

// const Pagination: React.FC<{ currentPage: number; totalPages: number; onPageChange: (page: number) => void }> = ({
//   currentPage,
//   totalPages,
//   onPageChange,
// }) => {
//   return (
//     <div className="flex justify-center mt-4">
//       {Array.from({ length: totalPages }, (_, index) => (
//         <button
//           key={index}
//           className={`px-4 py-2 mx-1 ${
//             currentPage === index + 1 ? 'bg-blue-500 text-white' : 'bg-gray-300 text-gray-700'
//           }`}
//           onClick={() => onPageChange(index + 1)}
//         >
//           {index + 1}
//         </button>
//       ))}
//     </div>
//   );
// };

// export default Pagination;
