import React from "react";
import { render, screen, fireEvent } from "@testing-library/react";
import { Provider } from "react-redux";
import store from "./../../store";
import PostList from "./PostList";
import {
  fetchPostsSuccess,
  fetchPostsError,
  setSearchTerm,
} from "../reducers/posts";

describe("PostList Component", () => {
  it("renders loading message", () => {
    render(
      <Provider store={store}>
        <PostList />
      </Provider>
    );

    const loadingElement = screen.getByText(/Loading.../i);
    expect(loadingElement).toBeInTheDocument();
  });

  it("renders error message", () => {
    render(
      <Provider store={store}>
        <PostList />
      </Provider>
    );

    const errorMessage = "Error fetching posts";
    store.dispatch(fetchPostsError(errorMessage));

    const errorElement = screen.getByText(`Error: ${errorMessage}`);
    expect(errorElement).toBeInTheDocument();
  });

  it("renders posts", () => {
    const mockPosts = [
      { id: 1, title: "Post 1", body: "Body 1" },
      { id: 2, title: "Post 2", body: "Body 2" },
    ];
    render(
      <Provider store={store}>
        <PostList />
      </Provider>
    );

    store.dispatch(fetchPostsSuccess(mockPosts));

    for (const post of mockPosts) {
      const titleElement = screen.getByText(post.title);
      const bodyElement = screen.getByText(post.body);
      expect(titleElement).toBeInTheDocument();
      expect(bodyElement).toBeInTheDocument();
    }
  });

  it("updates search term on input change", () => {
    render(
      <Provider store={store}>
        <PostList />
      </Provider>
    );

    const searchInput = screen.getByLabelText("Search");
    fireEvent.change(searchInput, { target: { value: "search term" } });

    expect(searchInput.value).toBe("search term");
  });

  it("clears search term on clear button click", () => {
    render(
      <Provider store={store}>
        <PostList />
      </Provider>
    );

    const searchInput = screen.getByLabelText("Search");
    fireEvent.change(searchInput, { target: { value: "search term" } });

    const clearButton = screen.getByText("Clear");
    fireEvent.click(clearButton);

    expect(searchInput.value).toBe("");
  });
});
