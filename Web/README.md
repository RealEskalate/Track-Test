## Web Test Guideline

### Introduction

Welcome to the web test for assessing candidates during the hiring process. In this test, candidates will be required to build a web application that interacts with a RESTful JSON API and demonstrates their proficiency in React, state management, and code quality. Candidates are expected to follow the instructions provided below to complete the test successfully.

### Task

Build a web application that interacts with the JSON API provided at the endpoint: `https://jsonplaceholder.typicode.com/posts`

### API Endpoint Details

Endpoint: `https://jsonplaceholder.typicode.com/posts`
Params:
- `limit`: To set the number of posts shown.
- `page`: The page you want to load.
- `q`: Search a keyword.

### Requirements

1. Using **React**, build a web application that queries the provided endpoint.
2. Implement a paginated display of posts, with the pagination reflected in the URL (so when the page is refreshed, the same results are shown).
3. **Implement a search functionality** that enables users to search for posts based on a keyword.
4. Use either **Redux** or **Redux Toolkit** for state management. Save the fetched results in the store and render them appropriately.

### Optional

1. Implement **unit testing** for at least **one component** and **one test for the Redux reducer**.
3. Add a loading state

### Submission

1. Candidates should create a **pull request** from their repository to the main repository.
2. The pull request should include a **detailed description** of the changes made and the features implemented.
3. Candidates should also include a **screenshot** of the application within the pull request description.


## Good luck!
