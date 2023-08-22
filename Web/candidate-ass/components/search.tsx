// const SearchResults = ({ match }) => {
//     const { keyword } = match.params;
  
//     // Use the keyword to fetch the posts from your API
//     const [posts, setPosts] = useState([]);
  
//     useEffect(() => {
//       axios.get(`/api/posts?keyword=${keyword}`)
//         .then(response => {
//           setPosts(response.data);
//         })
//         .catch(error => {
//           console.log(error);
//         });
//     }, [keyword]);
  
//     return (
//       <div>
//         <h1>Search Results</h1>
//         {posts.map(post => (
//           <div key={post.id}>
//             <h2>{post.title}</h2>
//             <p>{post.content}</p>
//           </div>
//         ))}
//       </div>
//     );
//   };
  