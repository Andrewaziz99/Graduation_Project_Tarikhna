import SidebarMenu from "./components/sidebar/Sidebar";
import Navbar from "./components/navbar/NavBar"

import Home from "./components/home/Home";
import Questions from "./components/Questions/Questions";
import Lessons from "./components/lesson/Lessons";
import { Routes, Route } from "react-router-dom";
const App = () => {

  return (<div className="App">


    <Navbar />
    <div className="row">
      <div className="col-2">
        <SidebarMenu />
      </div>
      <div className="col-10">
        <Routes>

          <Route path="/" element={<Home />} />
          <Route path="/lesson" element={<Lessons />} />
          <Route path="/questions" element={<Questions />} />

        </Routes>
      </div>
    </div>


  </div>
  );
}

export default App;
