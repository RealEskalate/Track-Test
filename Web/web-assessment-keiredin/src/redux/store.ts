import { configureStore, combineReducers } from "@reduxjs/toolkit";
import { postsAPI } from "../features/posts/postsAPI";
import postsReducer from "../features/posts/postsSlice";
const appReducer = combineReducers({
  [postsAPI.reducerPath]: postsAPI.reducer,
  posts: postsReducer,
});
export const store = configureStore({
  reducer: appReducer,

  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware({}).concat(postsAPI.middleware),
});

export type RootState = ReturnType<typeof appReducer>;
