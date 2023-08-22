import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import { getposts } from "./PostAPI";

const initialState = {
  value: [],
  status: "idle",
};

export const search = createAsyncThunk("counter/fetchPost", async (page, q) => {
  const response = await getposts(page, q);
  return response.data;
});

export const postSlice = createSlice({
  name: "postGetter",
  initialState,
  extraReducers: (builder) => {
    builder
      .addCase(search.pending, (state) => {
        state.status = "loading";
      })
      .addCase(search.fulfilled, (state, action) => {
        state.status = "idle";
        state.value = action.payload;
      });
  },
});

export const selectPosts = (state) => state.post.value;
export const selectStatus = (state) => state.post.status;

export default postSlice.reducer;
