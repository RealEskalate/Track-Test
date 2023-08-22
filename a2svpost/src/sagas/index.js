import { takeLatest, put, call, select } from "redux-saga/effects";
import axios from "axios";
import {
  fetchPostsSuccess,
  fetchPostsError,
  setTotalPages,
} from "../reducers/posts";

function* fetchPostsAsync() {
  try {
    const { currentPage, searchTerm } = yield select((state) => state.posts);
    const params = {
      _limit: 10,
      _page: currentPage,
      q: searchTerm,
    };
    const response = yield call(
      axios.get,
      "https://jsonplaceholder.typicode.com/posts",
      { params }
    );
    const totalCount = yield call(
      axios.head,
      "https://jsonplaceholder.typicode.com/posts",
      { params }
    );
    const totalPages = Math.ceil(
      Number(totalCount.headers["x-total-count"]) / 10
    );

    yield put(fetchPostsSuccess(response.data));
    yield put(setTotalPages(totalPages));
  } catch (error) {
    yield put(fetchPostsError(error.message));
  }
}

function* watchFetchPosts() {
  yield takeLatest("posts/fetchPosts", fetchPostsAsync);
}

export default function* rootSaga() {
  yield watchFetchPosts();
}
