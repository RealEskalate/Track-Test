import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';
import axios from 'axios';

const perPage = 10;

export const fetchPosts = createAsyncThunk('posts/fetchPosts', async (_, { getState }) => {
  const state = getState().posts;
  const { currentPage, searchKeyword } = state;
  const response = await axios.get(
    `https://jsonplaceholder.typicode.com/posts?_page=${currentPage}&_limit=${perPage}&q=${searchKeyword}`
  );
  const totalCount = Number(response.headers['x-total-count']);
  const totalPages = Math.ceil(totalCount / perPage);
  return response.data;
});

const postsSlice = createSlice({
  name: 'posts',
  initialState: {
    posts: [],
    currentPage: 1,
    searchKeyword: '',
  },
  reducers: {
    setPage: (state, action) => {
      state.currentPage = action.payload;
    },
    setSearchKeyword: (state, action) => {
      state.searchKeyword = action.payload;
    },
  },
  extraReducers: builder => {
    builder.addCase(fetchPosts.fulfilled, (state, action) => {
      state.posts = action.payload;
    });
  },
});

export const { setPage, setSearchKeyword } = postsSlice.actions;

export default postsSlice.reducer;