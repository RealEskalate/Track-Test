const initialState = {
    page: 1,
    searchText: '',
  };
  
  export const reducer = (state = initialState, action) => {
    switch (action.type) {
      case 'SET_PAGE':
        return { ...state, page: action.page };
      case 'SET_SEARCH_TEXT':
        return { ...state, searchText: action.searchText };
      default:
        return state;
    }
  };