import Posts from "./pages/Posts";
import { store } from "./redux/store";
import { Provider } from "react-redux";

function App() {
  return (
    <Provider store={store}>
      <Posts />;
    </Provider>
  );
}

export default App;
