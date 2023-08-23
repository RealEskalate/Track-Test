import { createSlice } from '@reduxjs/toolkit';

const initialPostsState = { posts: [] };

const postsSlice = createSlice({
  name: 'posts',
  initialState: initialPostsState,
  reducers: {
    update(state, action) {
        console.log(action.payload);
      return action.payload;
      console.log("s", state);
    },
  },
});

export const postsActions = postsSlice.actions;

export default postsSlice.reducer;