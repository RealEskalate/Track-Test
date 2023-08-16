import { createSlice } from "@reduxjs/toolkit";

const postSlice = createSlice({
  name: "posts",
  initialState: {
    posts: [],
    pageNumber: 1,
    searchValue: "",
    loading: true
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
    },
    turnOffLoading(state){
      state.loading = false;
    },
    turnOnLoading(state){
      state.loading = true;
    }
  },
});

export const postActions = postSlice.actions;
export default postSlice;