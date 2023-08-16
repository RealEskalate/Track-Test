import React, { useState } from "react";
import useFetch from "./useFetch";

const Search = () => {
    const { pending, error, data: values } = useFetch("https://jsonplaceholder.typicode.com/posts");
    const [ search, setSearch ] = useState([]);

    const handleSearch = (e) => {
        if (e.target.value === ""){
            setSearch([])
            return;
        }
    const filtered = values && values.find((value) =>
    value.title.toLowerCase().indexOf(e.target.value.toLowerCase()) !== -1
    );
    setSearch(filtered);
    }

    return(
        <div>
        <div> Search: <input type="text" onChange={handleSearch}/></div>
        { search &&
            <>
            <div>Title: {search.title}</div>
            <div>Body: {search.body}</div>
            <div>userId: {search.userId}</div>
            <div>Id: {search.id}</div>
            </>
        }
        </div>
    )
}

export default Search;