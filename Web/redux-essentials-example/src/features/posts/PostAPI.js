import axios from "axios";

const axiosInstance = axios.create({
  baseURL: "https://jsonplaceholder.typicode.com",
});

export const getposts = ({ page = 1 }, { q = "" }) => {
  return axiosInstance
    .get(`/posts/?_page=${page}&_limit=10`)
    .then((res) => {
      console.log(res);
      return res;
    })
    .catch((error) => {
      return error;
    });
};
