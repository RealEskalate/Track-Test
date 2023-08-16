import logo from './logo.svg';
import './App.css';
import axios from 'axios';
import React from 'react';
import PostPages from './components/PostPages';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Pagination from '@mui/material/Pagination';
import Stack from '@mui/material/Stack';
import { createTheme, Theme, ThemeProvider } from "@mui/material/styles"
import { useState } from 'react';
import TextField from '@mui/material/TextField';
import Pagn from './components/Pagn';
import { Box, Button } from '@mui/material';

function App() {



  return (
    <>
    <Pagn /> 
    </>
  );
}

export default App;
