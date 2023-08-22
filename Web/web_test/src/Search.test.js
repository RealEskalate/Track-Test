import { render, screen } from '@testing-library/react';
import App from './App';

test('render search input', () => {
    render(<App />);
    const inputEl = screen.getByTestId("search-input");
    expect(inputEl).toBeInTheDocument();
  });