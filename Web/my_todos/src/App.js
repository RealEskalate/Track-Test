import React from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';
import Navbar from './components/Navbar';
import HomePage from './pages/HomePage';
import AddTodoPage from './pages/AddTodoPage';
import EditTodoPage from './pages/EditTodoPage';
import SettingsPage from './pages/SettingsPage';
import LoginPage from './pages/LoginPage';
import UserProfilePage from './pages/UserProfilePage';
import CompletedTodosPage from './pages/CompletedTodosPage';
import CategoryPage from './pages/CategoryPage';
import SearchPage from './pages/SearchPage';
import AnalyticsPage from './pages/AnalyticsPage';
import SharedListsPage from './pages/SharedListsPage';

function App() {
  return (
    <Router>
      <div className="flex flex-col min-h-screen">
        <Navbar />

        <Switch>
          <Route exact path="/" component={HomePage} />
          <Route path="/add" component={AddTodoPage} />
          <Route path="/edit/:id" component={EditTodoPage} />
          <Route path="/settings" component={SettingsPage} />
          <Route path="/login" component={LoginPage} />
          <Route path="/profile" component={UserProfilePage} />
          <Route path="/completed" component={CompletedTodosPage} />
          <Route path="/category/:category" component={CategoryPage} />
          <Route path="/search" component={SearchPage} />
          <Route path="/analytics" component={AnalyticsPage} />
          <Route path="/shared" component={SharedListsPage} />
        </Switch>

        <footer className="bg-gray-200 py-4 text-center">
          &copy; 2023 Todo App. All rights reserved.
        </footer>
      </div>
    </Router>
  );
}

export default App;
