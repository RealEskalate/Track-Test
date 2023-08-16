// import { getPosts } from "./postAPI";
import { useState } from "react";
import { useSelector, useDispatch } from "react-redux";
import { search, selectPosts } from "./postSlice";

export default function Table() {
  const posts = useSelector(selectPosts);
  const dispatch = useDispatch();

  console.log(posts);
  const totalPages = 10;
  const [currentPage, setCurrentPage] = useState(1);

  dispatch(search(currentPage));

  const advertisements = [
    {
      id: "daf",
      title: "dfsd",
      body: "dfsd",
      created_at: "dfsd",
    },
    {
      id: "daf",
      title: "dfsd",
      body: "dfsd",
      created_at: "dfsd",
    },
    {
      id: "daf",
      title: "dfsd",
      body: "dfsd",
      created_at: "dfsd",
    },
  ];

  const isLoading = false;

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  if (posts.status != "loading") {
    return (
      <div class="flex justify-center items-center h-screen">
        <div role="status">
          <svg
            aria-hidden="true"
            class="w-8 h-8 mr-2 text-gray-200 animate-spin dark:text-gray-600 fill-blue-600"
            viewBox="0 0 100 101"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <path
              d="M100 50.5908C100 78.2051 77.6142 100.591 50 100.591C22.3858 100.591 0 78.2051 0 50.5908C0 22.9766 22.3858 0.59082 50 0.59082C77.6142 0.59082 100 22.9766 100 50.5908ZM9.08144 50.5908C9.08144 73.1895 27.4013 91.5094 50 91.5094C72.5987 91.5094 90.9186 73.1895 90.9186 50.5908C90.9186 27.9921 72.5987 9.67226 50 9.67226C27.4013 9.67226 9.08144 27.9921 9.08144 50.5908Z"
              fill="currentColor"
            />
            <path
              d="M93.9676 39.0409C96.393 38.4038 97.8624 35.9116 97.0079 33.5539C95.2932 28.8227 92.871 24.3692 89.8167 20.348C85.8452 15.1192 80.8826 10.7238 75.2124 7.41289C69.5422 4.10194 63.2754 1.94025 56.7698 1.05124C51.7666 0.367541 46.6976 0.446843 41.7345 1.27873C39.2613 1.69328 37.813 4.19778 38.4501 6.62326C39.0873 9.04874 41.5694 10.4717 44.0505 10.1071C47.8511 9.54855 51.7191 9.52689 55.5402 10.0491C60.8642 10.7766 65.9928 12.5457 70.6331 15.2552C75.2735 17.9648 79.3347 21.5619 82.5849 25.841C84.9175 28.9121 86.7997 32.2913 88.1811 35.8758C89.083 38.2158 91.5421 39.6781 93.9676 39.0409Z"
              fill="currentFill"
            />
          </svg>
          <span class="sr-only">Loading...</span>
        </div>
      </div>
    );
  }

  return (
    <div class="mt-4 mx-4">
      <div class="w-full overflow-hidden rounded-lg shadow-sm">
        <div class="w-full overflow-x-auto">
          <table class="w-full">
            <thead>
              <tr class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-300 bg-gray-50 dark:text-gray-500 dark:bg-gray-100">
                <th class="px-4 py-3">Id</th>
                <th class="px-4 py-3">Title</th>
                <th class="px-4 py-3">Body</th>
                <th class="px-4 py-3">Date</th>
              </tr>
            </thead>
            <tbody class="bg-white divide-y dark:divide-gray-300 dark:bg-gray-100">
              {posts.posts.map((advertisement) => (
                <tr class="bg-gray-50 dark:bg-gray-100 hover:bg-gray-100 dark:hover:bg-gray-400 text-gray-700 dark:text-black">
                  <td class="px-4 py-3">
                    <div class="flex items-center text-sm">
                      <p class="font-semibold">{advertisement.id}</p>
                      <p class="text-xs text-gray-600 dark:text-black">
                        {advertisement.userId}
                      </p>
                    </div>
                  </td>
                  <td class="px-4 py-3 text-sm">
                    {" "}
                    <div>
                      <p className="inline-flex rounded-full bg-yellow-500 bg-opacity-10 py-1 px-3 text-sm font-medium text-yellow-500">
                        {advertisement.title}
                      </p>
                    </div>
                  </td>
                  <td class="px-4 py-3 text-sm">{advertisement.body}</td>
                  <td class="px-4 py-3 text-sm">
                    {/* {advertisement.created_at} */}
                    {/* {new Date(advertisement.created_at).toLocaleDateString(
                      "en-US"
                    )} */}
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
        <div class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-300 bg-gray-50 sm:grid-cols-9 dark:text-black dark:bg-gray-100">
          <span class="flex items-center col-span-3">
            {" "}
            Showing {(currentPage - 1) * 6 + 1} - {currentPage * 6} of{" "}
            {advertisements.count}{" "}
          </span>
          <span class="col-span-2"></span>
          <span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
            <nav aria-label="Table navigation">
              <ul class="inline-flex items-center">
                {currentPage > 1 && (
                  <li>
                    <button
                      class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
                      aria-label="Previous"
                      onClick={() => handlePageChange(currentPage - 1)}
                    >
                      <svg
                        aria-hidden="true"
                        class="w-4 h-4 fill-current"
                        viewBox="0 0 20 20"
                      >
                        <path
                          d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
                          clip-rule="evenodd"
                          fill-rule="evenodd"
                        ></path>
                      </svg>
                    </button>
                  </li>
                )}
                {Array.from({ length: totalPages }, (_, i) => (
                  <li key={i}>
                    <button
                      class={`px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple  ${
                        i + 1 === currentPage ? "bg-gray-300" : "bg-white"
                      }`}
                      onClick={() => handlePageChange(i + 1)}
                    >
                      {i + 1}
                    </button>
                  </li>
                ))}
                {currentPage < totalPages && (
                  <li>
                    <button
                      class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
                      aria-label="Next"
                      onClick={() => handlePageChange(currentPage + 1)}
                    >
                      <svg
                        class="w-4 h-4 fill-current"
                        aria-hidden="true"
                        viewBox="0 0 20 20"
                      >
                        <path
                          d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
                          clip-rule="evenodd"
                          fill-rule="evenodd"
                        ></path>
                      </svg>
                    </button>
                  </li>
                )}
              </ul>
            </nav>
          </span>
        </div>
      </div>
    </div>
  );
}
