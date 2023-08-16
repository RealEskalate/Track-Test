## Web Test Guideline

### Introduction

Welcome to the web test for assessing candidates during the hiring process. In this test, candidates will be required to build a web application that interacts with a RESTful JSON API and demonstrates their proficiency in React, state management, and code quality. Candidates are expected to follow the instructions provided below to complete the test successfully.

### Task

Build a web application that interacts with the JSON API provided at the endpoint: `https://jsonplaceholder.typicode.com/posts`

### API Endpoint Details

Endpoint: `https://jsonplaceholder.typicode.com/posts`
Params:
- `_limit`: To set the number of posts shown.
- `_page`: The page you want to load.
- `q`: Search a keyword.

### Requirements

1. Using **React or Next**, build a web application that queries the provided endpoint.
2. Implement a paginated display of posts (10 per page), with the pagination reflected in the URL (so when the page is refreshed, the same results are shown).
3. **Implement a search functionality** that enables users to search for posts based on a keyword. This should also be reflected on the URL.
4. Use either **Redux** or **Redux Toolkit** for state management. Save the fetched results in the store and render them appropriately.
5. Use a UI library (Ex. Material UI, TailwindCSS ...)

### Optional

1. Implement **unit testing** for at least **one component**
2. Implement **unit testing** on your **state management**.
3. Add a loading state

### Submission

1. Add your code in the web folder.
2. You should create a branch with **[yourname].track_test** on this repository.
3. You should create a **pull request** from your branch to the main branch.
4. The pull request should include a **detailed description** of the changes made and the features implemented.
5. You should also include a **screenshot** of the application within the pull request description.


## Good luck!
