import * as React from 'react';
import Pagination from '@mui/material/Pagination';
import Stack from '@mui/material/Stack';
import '.././App.css';
import { useState } from 'react';
import PostPages from './PostPages';
import { Box, Button, H1 } from '@mui/material';
import TextField from '@mui/material/TextField';
import Typography from '@mui/material/Typography';
import { useDispatch, useSelector } from 'react-redux';
import { setPage, setSearchText } from '../Redux/actions';

export default function Pagn() {
    // using normal state change
    
      // const [page, setPage] = useState(1)
      // const [searchText, setSearchText] = useState('');

      // const changepage = (event, value) => {
      //     setPage(value)
      //     console.log(page)
      // };

      // const handleSearchTextChange = (event) => {
      //     setSearchText(event.target.value);
      //     setPage(page)
      //   };
      
    // Using Redux
      const dispatch = useDispatch();
      const page = useSelector((state) => state.page);
      const searchText = useSelector((state) => state.searchText);

      const changepage = (event, value) => {
        dispatch(setPage(value));
        console.log(page);
      };

      const handleSearchTextChange = (event) => {
        dispatch(setSearchText(event.target.value));
        dispatch(setPage(page));
      };

  return (
    <>
     <Typography sx={{ marginLeft: 34, fontSize: 54  }} color="text.secondary" gutterBottom>
         Latest Posts By guterez
      </Typography> 

    <Box sx={{ paddingTop: 5, paddingLeft: 4 }}> 
    <TextField id="outlined-basic" label="Search" variant="outlined" 
     value={searchText}
     onChange={handleSearchTextChange}
    />
    </Box>

    <Stack sx={{ paddingTop: 5, paddingLeft: 4 }} spacing={2}>
      <Pagination className="something" count={10} variant="outlined" color="secondary"
      onChange={changepage} />
      <PostPages page={page} search={searchText} />
    </Stack>
    </>
  );
}