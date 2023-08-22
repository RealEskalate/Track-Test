import { createSlice } from "@reduxjs/toolkit";

export const initialState = {
  posts: [],
  loading: false,
  error: null,
  currentPage: 1,
  totalPages: 1,
  searchTerm: "",
};

const postsSlice = createSlice({
  name: "posts",
  initialState,
  reducers: {
    fetchPosts: (state) => {
      state.loading = true;
      state.error = null;
    },
    fetchPostsSuccess: (state, action) => {
      state.loading = false;
      state.posts = action.payload;
    },
    fetchPostsError: (state, action) => {
      state.loading = false;
      state.error = action.payload;
    },
    setPage: (state, action) => {
      state.currentPage = action.payload;
    },
    setSearchTerm: (state, action) => {
      state.searchTerm = action.payload;
    },
    setTotalPages: (state, action) => {
      state.totalPages = action.payload;
    },
  },
});

export const {
  fetchPosts,
  fetchPostsSuccess,
  fetchPostsError,
  setPage,
  setSearchTerm,
  setTotalPages,
} = postsSlice.actions;

export default postsSlice.reducer;
