/**
 * @jest-environment jsdom
 */
import React from "react";
import { render } from "@testing-library/react";
import "@testing-library/jest-dom/extend-expect";
import Post from "./Post"; 
import { IPost as PostType } from "../../features/posts/types";

describe("Post Component", () => {
  it("renders post title and body correctly", () => {
    // Prepare mock data
    const mockPost: PostType = {
      id: 1,
      title: "Sample Title",
      body: "Sample Body",
      userId: 1,
    };
    const { getByText } = render(<Post post={mockPost} />);

    expect(getByText("Sample Title")).toBeInTheDocument();
    expect(getByText("Sample Body")).toBeInTheDocument();
  });
});
