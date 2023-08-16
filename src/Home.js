import ArtistList from "./ArtistList";
import useFetch from "./useFetch";
import Search from "./search"; 
const Home = () => {
  const { error, isPending, data: blogs } = useFetch('https://jsonplaceholder.typicode.com/posts')

  return (
    <div className="home">
      { error && <div>{ error }</div> }
      { isPending && <div>Loading...</div> }
      { blogs && 
      <>
        <Search/>
        <ArtistList blogs={blogs} />
      </>
      }
    </div>
  );
}
 
export default Home;