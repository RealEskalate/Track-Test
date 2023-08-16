import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import { getposts } from "./PostAPI";

const initialState = {
  posts: [
    {
      id: "adaf",
      title: "dfsd",
      body: "dfsd",
      created_at: "dfsd",
    },
    {
      id: "daf",
      title: "dfsnd",
      body: "dfsd",
      created_at: "dfsd",
    },
    {
      id: "daf",
      title: "dfsd",
      body: "dfsd",
      created_at: "dfsd",
    },
  ],
  status: "idle",
};

export const search = createAsyncThunk(
  "counter/fetchPost",
  async (page, limit, q) => {
    const response = await getposts(page, limit, q);
    return response.data;
  }
);

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

export const selectPosts = (state) => state.post;

export default postSlice.reducer;
