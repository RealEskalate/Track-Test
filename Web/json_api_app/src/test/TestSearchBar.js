import React from 'react';
import { render, screen, fireEvent } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { MemoryRouter } from 'react-router-dom'; // Import MemoryRouter for testing useLocation

import SearchBar from '../components/SearchBar';

test('search bar functionality', () => {
  const navigateMock = jest.fn();

  render(
    <MemoryRouter>
      <SearchBar />
    </MemoryRouter>
  );

  const inputElement = screen.getByPlaceholderText('Search posts...');
  const searchButton = screen.getByRole('button', { name: 'Search' });

  // Simulate user typing a search query
  userEvent.type(inputElement, 'test query');

  // Simulate user clicking the search button
  fireEvent.click(searchButton);

  // Ensure navigate is called with the correct URL
  expect(navigateMock).toHaveBeenCalledWith('/?q=test%20query');
});
