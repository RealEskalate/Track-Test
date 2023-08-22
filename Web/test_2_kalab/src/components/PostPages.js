import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Box, Button } from '@mui/material';
import TextField from '@mui/material/TextField';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';

function PostPages({page, search}) {
  const [posts, setPosts] = useState([]);
  

  console.log(page)
  console.log(search)
//   const page = match.params.page || 1;

  useEffect(() => {
    console.log(search)
    if (search === ''){
        fetch(`https://jsonplaceholder.typicode.com/posts?_limit=10&_page=${page}`)
      .then((res) => res.json())
      .then((data) => setPosts(data));
      console.log(posts)
    }
    else{
        fetch(`https://jsonplaceholder.typicode.com/posts?_limit=10&_page=${page}&q=${search}`)
        .then((res) => res.json())
        .then((data) => setPosts(data));
        console.log(posts)  
    }
    
  }, [page, search]);





  return (
    <>
    
    <Box sx={{ paddingTop: 4, paddingLeft: 4 }}>
      <ul>
        {posts.map((post) => (
          <li key={post.id}>  
          <Card sx={{ marginTop: 2, minWidth: 500, maxWidth: 700 }}>
          <CardContent>
              <Typography sx={{ fontSize: 14 }} color="text.secondary" gutterBottom>
              {post.title}
              </Typography>
    
              <Typography variant="body2">
              {post.body}
              </Typography>
          </CardContent>
          </Card>  </li>
               
        ))}
      </ul>
    </Box>

    <style>{`ul li { list-style: none; }`}</style>
    </>
  );
}

export default PostPages;
