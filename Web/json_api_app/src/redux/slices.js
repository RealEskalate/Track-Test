// src/features/postsSlice.js
import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import axios from 'axios';

export const fetchPosts = createAsyncThunk('posts/fetchPosts', async ({ _limit, _page, q }) => {
  const response = await axios.get('https://jsonplaceholder.typicode.com/posts', {
    params: { _limit, _page, q },
  });
  return response.data;
});

const postsSlice = createSlice({
  name: 'posts',
  initialState: {
    data: [],
    status: 'idle',
    error: null,
  },
  reducers: {},
  extraReducers: (builder) => {
    builder
      .addCase(fetchPosts.pending, (state) => {
        state.status = 'loading';
      })
      .addCase(fetchPosts.fulfilled, (state, action) => {
        state.status = 'succeeded';
        state.data = action.payload;
      })
      .addCase(fetchPosts.rejected, (state, action) => {
        state.status = 'failed';
        state.error = action.error.message;
      });
  },
});

export default postsSlice.reducer;
export const selectAllPosts = (state) => state.posts.data;
export const selectPostById = (state, postId) =>
  state.posts.data.find((post) => post.id === postId);
export const selectPostsStatus = (state) => state.posts.status;
