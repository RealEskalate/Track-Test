import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';

const SearchBar = () => {
  const navigate = useNavigate();
  const [searchQuery, setSearchQuery] = useState('');

  const handleSearch = (e) => {
    e.preventDefault();
    navigate(`/?q=${searchQuery}`)
    
  };

  return (
    <form onSubmit={handleSearch} className="mb-4">
      <input
        type="text"
        value={searchQuery}
        onChange={(e) => setSearchQuery(e.target.value)}
        placeholder="Search posts..."
        className="border border-gray-300 rounded px-2 py-1 w-1/2"
      />
      <button type="submit" className="bg-blue-500 text-white px-3 py-1 ml-2 rounded">
        Search
      </button>
    </form>
  );
};

export default SearchBar;
