import * as React from 'react';
import Pagination from '@mui/material/Pagination';
import Stack from '@mui/material/Stack';
import '.././App.css';
import { useState } from 'react';
import PostPages from './PostPages';
import { Box, Button } from '@mui/material';
import TextField from '@mui/material/TextField';

export default function Pagn() {
    const [page, setPage] = useState(1)
    const [searchText, setSearchText] = useState('');

    const changepage = (event, value) => {
        setPage(value)
        console.log(page)
    };

    const handleSearchTextChange = (event) => {
        setSearchText(event.target.value);
        setPage(page)
      };
      
  return (
    <>
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