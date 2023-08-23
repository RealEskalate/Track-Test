// import React, { useState } from 'react';

// const SearchBar: React.FC<{ onSearch: (query: string) => void }> = ({ onSearch }) => {
//   const [searchQuery, setSearchQuery] = useState('');

//   const handleSearch = () => {
//     onSearch(searchQuery);
//   };

//   return (
//     <div className="flex items-center justify-center mt-4">
//       <input
//         type="text"
//         className="px-4 py-2 border rounded-l-md focus:outline-none focus:border-blue-500"
//         placeholder="Search"
//         value={searchQuery}
//         onChange={(e) => setSearchQuery(e.target.value)}
//       />
//       <button
//         className="px-4 py-2 bg-blue-500 text-white rounded-r-md hover:bg-blue-600 focus:outline-none focus:bg-blue-600"
//         onClick={handleSearch}
//       >
//         Search
//       </button>
//     </div>
//   );
// };

// export default SearchBar;
