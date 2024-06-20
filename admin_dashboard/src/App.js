import SidebarMenu from "./components/sidebar/Sidebar";
import Navbar from "./components/navbar/NavBar"

import Home from "./components/home/Home";
import Questions from "./components/Questions/Questions";
import Lessons from "./components/lesson/Lessons";
import { Routes, Route } from "react-router-dom";
import { useState } from "react";
import LoginPage from "./components/login/Login";
import RegisterPage from "./components/login/Register";
const App = () => {

  return (<div className="App">

    <Navbar />

    <Routes>
      <Route path="/" element={<LoginPage />} />
      <Route path="/register" element={<RegisterPage />} />
      <Route path="/home" element={<Home />} />
      <Route path="/lesson" element={<Lessons />} />
      <Route path="/questions" element={<Questions />} />

    </Routes>

  </div>
  );
}

export default App;
