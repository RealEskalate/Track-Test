import { useState } from "react";
import { useDispatch } from "react-redux";
import { postActions } from "../../store/postSlice";
import IconButton from "@mui/material/IconButton";
import SearchIcon from '@mui/icons-material/Search';
import TextField from "@mui/material/TextField";

const SearchBar = (props) => {
    const [searchValue, setSearchValue] = useState("");
    const searchHandler = (e) => {
        e.preventDefault();
      dispatch(postActions.changeSearchValue({searchValue: searchValue}));
    }
    const dispatch = useDispatch();

    return  (
    <div className="search"><form onSubmit={searchHandler}>
        
      <TextField
        id="search-bar"
        className="text"
        data-testid="search-input"
        onInput={(e) => {
       setSearchValue(e.target.value);
        }}
        label="Search Posts"
        variant="outlined"
        placeholder="Search..."
        size="small"
      />
      <IconButton type="submit" aria-label="search">
        <SearchIcon style={{ fill: "blue" }} />
      </IconButton>
    </form>
    </div>
  )};

  export default SearchBar;