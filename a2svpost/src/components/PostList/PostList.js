import React, { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import {
  Container,
  TextField,
  Typography,
  Grid,
  InputAdornment,
  Button,
  Pagination,
  Paper,
  List,
  ListItem,
  ListItemText,
  CircularProgress,
  Box,
} from "@mui/material";
import SearchIcon from "@mui/icons-material/Search";
import { fetchPosts, setPage, setSearchTerm } from "../../reducers/posts";

export default function PostList() {
  const dispatch = useDispatch();
  const { posts, loading, error, currentPage, totalPages, searchTerm } =
    useSelector((state) => state.posts);

  useEffect(() => {
    dispatch(fetchPosts());
  }, [dispatch]);

  const handlePageChange = (event, value) => {
    dispatch(setPage(value));
    dispatch(fetchPosts());
  };

  const handleSearch = (event) => {
    dispatch(setSearchTerm(event.target.value));
    dispatch(fetchPosts());
  };

  return (
    <Container>
      <Typography variant="h4" gutterBottom textAlign="center" margin={"1em"}>
        A2SV Posts
      </Typography>
      <TextField
        label="Search"
        variant="outlined"
        fullWidth
        value={searchTerm}
        onChange={handleSearch}
        InputProps={{
          endAdornment: (
            <InputAdornment position="end">
              <Button onClick={() => dispatch(setSearchTerm(""))}>Clear</Button>
            </InputAdornment>
          ),
          startAdornment: (
            <InputAdornment position="start">
              <SearchIcon />
            </InputAdornment>
          ),
        }}
      />
      <Paper elevation={3} style={{ marginTop: "16px" }}>
        <List>
          {loading ? (
            <Box
              style={{
                display: "flex",
                justifyContent: "center",
                marginTop: "20px",
              }}
            >
              <CircularProgress />
            </Box>
          ) : error ? (
            <ListItem>
              <ListItemText primary={`Error: ${error}`} />
            </ListItem>
          ) : (
            posts.map((post) => (
              <ListItem key={post.id} divider>
                <ListItemText primary={post.title} secondary={post.body} />
              </ListItem>
            ))
          )}
        </List>
      </Paper>
      <Grid
        container
        justifyContent="center"
        style={{
          padding: "3em",
        }}
      >
        <Pagination
          count={totalPages}
          page={currentPage}
          onChange={handlePageChange}
        />
      </Grid>
    </Container>
  );
}
