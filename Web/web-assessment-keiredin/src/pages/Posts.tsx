import React, { useState } from "react";
import Input from "../components/_shared/Input";
import ClipLoader from "react-spinners/ClipLoader";
import { useGetPostsQuery } from "../features/posts/postsAPI";
import Post from "../components/Posts/Post";
import { RootState } from "../redux/store";
import { useDispatch, useSelector } from "react-redux";
import { setCurrentPage, setItemsPerPage, setSearch } from "../features/posts/postsSlice";
function Posts() {
  const { currentPage, itemsPerPage, search } = useSelector(
    (state: RootState) => state.posts
  );
  const dispatch = useDispatch();
  const { data: posts, isFetching } = useGetPostsQuery({
    _limit: itemsPerPage,
    _page: currentPage,
    q: search,
  });
  return (
    <div className="w-full flex flex-col p-5 gap-3 items-center overflow-auto">
      <div className="w-full">
        <div className="w-52 items-start">
          <Input
            onChange={(val) => dispatch(setSearch(val))}
            value={search ?? ""}
            placeholder="Search posts..."
          />
        </div>
      </div>
      {/* Posts List */}
      <div className="min-h-[50vh]">
        {isFetching ? (
          <ClipLoader color={"#000080"} loading={true} size={25} />
        ) : posts!.length === 0 ? (
          <div className="font-medium text-lg">No posts found</div>
        ) : (
          <div className="w-full grid grid-cols-4 gap-3">
            {posts!.map((post) => (
              <Post post={post} key={post.id} />
            ))}
          </div>
        )}
      </div>

      {/* Pagination Controls */}
      <div className="flex flex-row gap-2">
        <div className="flex items-center justify-between gap-2">
          <button
            className={`px-3 py-2 bg-blue-500 text-white rounded 
                     ${currentPage === 1 && "opacity-50 cursor-not-allowed"}`}
            disabled={currentPage === 1}
            onClick={() =>
              dispatch(setCurrentPage(Math.max(currentPage - 1, 1)))
            }
          >
            {"<< Prev"}
          </button>
          <span className="text-lg">Page {currentPage}</span>
          <button
            className="px-4 py-2 bg-blue-500 text-white rounded"
            onClick={() => dispatch(setCurrentPage(currentPage + 1))}
          >
            {"Next >>"}
          </button>
        </div>

        {/* Items per page Dropdown */}
        <div className="">
          <label className="mr-2 text-lg" htmlFor="itemsPerPage">
            Items per page:
          </label>
          <select
            id="itemsPerPage"
            className="border rounded px-3 py-2"
            value={itemsPerPage}
            onChange={(e) => dispatch(setItemsPerPage(Number(e.target.value)))}
          >
            <option value={5}>5</option>
            <option value={10}>10</option>
            <option value={10}>15</option>
            <option value={20}>20</option>
          </select>
        </div>
      </div>
    </div>
  );
}

export default Posts;
