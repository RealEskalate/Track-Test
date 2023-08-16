import { createSlice, PayloadAction } from "@reduxjs/toolkit";

interface PostsState {
  currentPage: number;
  itemsPerPage: number;
  search: string | undefined;
}

const initialState: PostsState = {
  currentPage: 1,
  itemsPerPage: 5,
  search: undefined,
};

const postsSlice = createSlice({
  name: "posts",
  initialState,
  reducers: {
    setCurrentPage: (state, action: PayloadAction<number>) => {
      state.currentPage = action.payload;
    },
    setItemsPerPage: (state, action: PayloadAction<number>) => {
      state.itemsPerPage = action.payload;
    },
    setSearch: (state, action: PayloadAction<string | undefined>) => {
      state.search = action.payload;
      state.currentPage = 1;
    },
  },
});

export const { setCurrentPage, setItemsPerPage, setSearch } = postsSlice.actions;

export default postsSlice.reducer;
