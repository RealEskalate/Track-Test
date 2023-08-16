import * as React from 'react';
import { useEffect } from 'react';
import { useDispatch, useSelector } from "react-redux";
import { postActions } from "../../store/postSlice";
import Pagination from '@mui/material/Pagination';

import Stack from '@mui/material/Stack';
import PostItem from '../../components/Post/PostItem';
import "./Post.css";

export default function Post() {

    const dispatch = useDispatch();
    const loading = useSelector((state) => state.posts.loading);
    const posts = useSelector((state) => state.posts.posts);
    const pageNumber = useSelector((state) => state.posts.pageNumber);
    const searchValue = useSelector((state) => state.posts.searchValue);
 
    useEffect(() => {
       
        fetch("https://jsonplaceholder.typicode.com/posts?_page="+pageNumber+"&_limit=10&q=" +searchValue).then(res => {
            if (!res.ok){
                throw new Error("Reponse not ok")
            }
            return res.json()
        }).then(res => {
            dispatch(postActions.replacePosts(res));
            dispatch(postActions.turnOffLoading());
        }).catch(err => {
            console.log(err)
        });
    },[pageNumber, searchValue]);

    const paginationHandler = (event) => {
        dispatch(postActions.changePageNumber({pageNumber: event.target.textContent}));
    }
  return (
    <>
    {loading && <h1 style={{textAlign: "center"}}>Loading...</h1>}
    {!loading && posts.length < 1 && <h1 style={{textAlign: "center"}}>No Post</h1>}
    {posts.length > 0 && posts.map(post => (<PostItem key={post.id} title={post.title} body={post.body}/>))}
    
    {posts.length > 0 &&  <Stack spacing={2}>
        
      <Pagination count={10} shape="rounded" onClick={paginationHandler}/>
     
    </Stack>
    }
    </>
  );
}