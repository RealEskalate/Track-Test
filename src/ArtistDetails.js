import * as React from 'react';
import { useNavigate, useParams } from "react-router-dom";
import { styled } from '@mui/material/styles';
import useFetch from "./useFetch";
import "./details.css";
import Grid from '@mui/material/Grid';
import Box from '@mui/material/Box';
import Stack from '@mui/material/Stack';

const ArtistDetails = () => {
  const { id } = useParams();
  const { data: artist, error, isPending } = useFetch('https://jsonplaceholder.typicode.com/posts/' + id);

  return (
    <div className="blog-details">
      { isPending && <div>Loading...</div> }
      { error && <div>{ error }</div> }
      { artist && (
            <div className="details" key={id}>
              <div className="big-img">
                <Grid direction="column">
                <Box sx={{ width: '100%' }}>
                <Stack spacing={2}>
                <Grid>
                <h1>{ artist.title }</h1>
                </Grid>
                <Grid className="grid">
                <p>userId: { artist.userId }</p>
                </Grid>
                <Grid className="grid">
                <p>id: { artist.id }</p>
                </Grid>
                <Grid className="grid">
                <p>body: { artist.body }</p>
                </Grid>
                </Stack>
                </Box>
                </Grid>
              </div>

            </div>
      )}

    </div>
  );
}

export default ArtistDetails;

