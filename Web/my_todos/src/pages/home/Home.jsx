import React from 'react';
import TodoList from '../components/TodoList';

const HomePage = () => {
  return (
    <div className="container mx-auto p-4">
      <h2 className="text-2xl font-bold mb-4">Todo List</h2>
      <TodoList />
    </div>
  );
};

export default HomePage;