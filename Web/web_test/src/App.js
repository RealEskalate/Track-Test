import logo from './logo.svg';
import { useDispatch, useSelector } from "react-redux";
import { CssBaseline, ThemeProvider } from "@mui/material";
import { ColorModeContext, useMode } from "./theme";
import { Routes, Route, useNavigate } from "react-router-dom";
import SearchBar from './components/Search/Search';
import Post from './pages/Post/Post'; 
import './App.css';

function App() {
  const [theme, colorMode] = useMode();
  const posts = useSelector((state) => state.posts.posts);
  return (
    <ColorModeContext.Provider value={colorMode}>
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <br/>
    <SearchBar/>
    <Post/>
    </ThemeProvider>
    </ColorModeContext.Provider>
  );
}

export default App;
