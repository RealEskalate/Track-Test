import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';

import './App.css';
import DisplayPosts from './DisplayPosts';

function App() {
  return (
    <Router>
      <Routes>
        <Route exact path="/" element={<DisplayPosts />} />
        <Route path="/search/:keyword" element={<DisplayPosts />} />
      </Routes>
    </Router>
  );
}

export default App;
