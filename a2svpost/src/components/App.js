import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { Container } from "@mui/material";
import PostList from "./PostList/PostList";

function App() {
  return (
    <Container>
      <Router>
        <Routes>
          <Route path="/" element={<PostList />} />
        </Routes>
      </Router>
    </Container>
  );
}

export default App;
