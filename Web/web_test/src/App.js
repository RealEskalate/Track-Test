import { useSelector } from "react-redux";
import { CssBaseline, ThemeProvider } from "@mui/material";
import { ColorModeContext, useMode } from "./theme";
import { Routes, Route } from "react-router-dom";
import SearchBar from './components/Search/Search';
import Post from './pages/Post/Post'; 
import './App.css';

function App() {
  const [theme, colorMode] = useMode();
  return (
    <ColorModeContext.Provider value={colorMode}>
    <ThemeProvider theme={theme}>
      <CssBaseline />
      <br/>
    <SearchBar/>
    <Routes>
    <Route path="/" element={ <Post/>} />
    </Routes>
   
    </ThemeProvider>
    </ColorModeContext.Provider>
  );
}

export default App;
