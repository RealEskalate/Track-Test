
import { createSlice, PayloadAction, ThunkAction } from '@reduxjs/toolkit';
import {  RootState, AppDispatch } from './store'; 
import { Action } from 'redux';
interface Post {
  userId: number;
  id: number;
  title: string;
  body: string;
}

interface PostsState {
  posts: Post[];
  loading: boolean;
  error: string | null;
}

const initialState: PostsState = {
  posts: [],
  loading: false,
  error: null,
};

const postsSlice = createSlice({
  name: 'posts',
  initialState,
  reducers: {
    fetchPostsStart: (state) => {
      state.loading = true;
      state.error = null;
    },
    fetchPostsSuccess: (state, action: PayloadAction<Post[]>) => {
      state.posts = action.payload;
      state.loading = false;
      state.error = null;
    },
    fetchPostsFailure: (state, action: PayloadAction<string>) => {
      state.loading = false;
      state.error = action.payload;
    },
  },
});

export const { fetchPostsStart, fetchPostsSuccess, fetchPostsFailure } = postsSlice.actions;

// Thunk action to fetch posts from the API
export const fetchPosts = (): ThunkAction<void, RootState, null, Action<string>> => async (dispatch) => {
  try {
    dispatch(fetchPostsStart());
    const response = await fetch('https://jsonplaceholder.typicode.com/posts');
    const data = await response.json();
    dispatch(fetchPostsSuccess(data));
  } catch (error) {
    dispatch(fetchPostsFailure('An error occurred while fetching posts.'));
  }
};

// Selector to access posts state from the Redux store
export const selectPosts = (state: RootState) => state.posts.posts;
export const selectLoading = (state: RootState) => state.posts.loading;
export const selectError = (state: RootState) => state.posts.error;

export default postsSlice.reducer;
