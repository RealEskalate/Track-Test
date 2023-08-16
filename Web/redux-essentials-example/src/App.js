import React from "react";
import logo from "./logo.svg";
// import { Counter } from "./features/counter/Counter";
import "./App.css";
import Table from "./features/posts/Post";
function App() {
  return (
    <div className="App">
      <header className="App-header">
        <p class="text-3xl font-bold"> Posts </p>
        <Table />
      </header>
    </div>
  );
}

export default App;
