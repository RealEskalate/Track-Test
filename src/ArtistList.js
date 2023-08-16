import { useNavigate } from 'react-router-dom';
import Box from '@mui/material/Box';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Typography from '@mui/material/Typography';
import Grid from '@mui/material/Grid';

const ArtistList = ({ blogs }) => {
    const navigate = useNavigate();

  return (
    <div style={{ display: "flex", flexWrap: "wrap" }} className="blog-list">
      {blogs.map((blog, index) => (
        <>
        <Box component="span"
    sx={{ display: 'inline-block', mx: '2px', transform: 'scale(0.8)' }}>
        <Grid flex container spacing={{ xs: 2, md: 3 }} columns={{ xs: 4, sm: 8, md: 12 }} direction="row">
        <Grid item xs={2} sm={4} md={4} key={index} >
        
        <Card sx={{ minWidth: 275 }} style={{backgroundColor: "#e0e7af"}} >
        
        <CardContent>
          <Typography variant="h5" color="text.secondary" gutterBottom>
            { blog.title }
          </Typography>
        </CardContent>
        <button className="btn" onClick={(e) => {
          navigate(`/blogs/${ blog.id }`);
      }}>Details</button>
      </Card>
      <br/>
      <br/>
      </Grid>
        </Grid>
        </Box>
      </>
      ))}
     </div> 
  );
}
 
export default ArtistList;