// src/store.js
import { configureStore } from '@reduxjs/toolkit';
import postsReducer from './slices'

const store = configureStore({
  reducer: {
    posts: postsReducer,
  },
});

export default store;
