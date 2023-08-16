import { createSlice } from "@reduxjs/toolkit";

const postSlice = createSlice({
  name: "posts",
  initialState: {
    posts: [],
    pageNumber: 1,
    searchValue: ""
  },
  reducers: {
    replacePosts(state, action) {
      state.posts = action.payload;
    },
    changePageNumber(state, action){
        state.pageNumber = action.payload.pageNumber;
    },
    changeSearchValue(state, action){
      state.searchValue = action.payload.searchValue
    }
  },
});

export const postActions = postSlice.actions;
export default postSlice;