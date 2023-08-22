import postsReducer, {
  fetchPosts,
  fetchPostsSuccess,
  fetchPostsError,
  initialState,
} from "./posts";

describe("postsReducer", () => {
  it("should handle initial state", () => {
    expect(postsReducer(undefined, {})).toEqual({
      posts: [],
      loading: false,
      error: null,
      currentPage: 1,
      totalPages: 1,
      searchTerm: "",
    });
  });

  it("should handle fetchPosts", () => {
    expect(postsReducer(undefined, fetchPosts())).toEqual({
      ...initialState,
      loading: true,
    });
  });

  it("should handle fetchPostsSuccess", () => {
    const mockPosts = [{ id: 1, title: "Post 1" }];
    expect(postsReducer(undefined, fetchPostsSuccess(mockPosts))).toEqual({
      ...initialState,
      loading: false,
      posts: mockPosts,
    });
  });

  it("should handle fetchPostsError", () => {
    const mockError = "Error fetching posts";
    expect(postsReducer(undefined, fetchPostsError(mockError))).toEqual({
      ...initialState,
      loading: false,
      error: mockError,
    });
  });
});
