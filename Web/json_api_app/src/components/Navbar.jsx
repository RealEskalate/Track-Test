import React from 'react';
import { Link } from 'react-router-dom';

const Navbar = () => {
  return (
    <nav className="bg-blue-500 p-4 text-white">
      <div className="container mx-auto flex justify-between">
        <Link to="/" className="text-lg font-bold">
          Todo App
        </Link>
        <ul className="flex space-x-4">
          <li>
            <Link to="/add">Add Todo</Link>
          </li>
          <li>
            <Link to="/settings">Settings</Link>
          </li>
          {/* Add more links here */}
        </ul>
      </div>
    </nav>
  );
};

export default Navbar;
