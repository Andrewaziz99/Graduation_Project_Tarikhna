import "./NavBar.css";
import "bootstrap/dist/css/bootstrap.min.css"
import logo from "../../assets/teacher.png";
import { Link } from "react-router-dom";
const Navbar = ({ sidebarOpen, openSidebar }) => {
    return (
        <nav className="navbar navbar-light bg-light">
            <div className="container-fluid">
                <Link to="/" className="text-decoration-none text-black d-none d-sm-inline d-flex align-itemcenter ms-3 mt-2">
                    <img src={logo} alt="logo" width="40" height="40" class="d-inline-block" />
                    <span className="sidebar-header fw-bold ms-1 fs-3">Tarikhna</span>

                </Link>
                <hr className="text-secondary d-none d-sm-block" />
                <form className="d-flex">
                    <input className="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                    <button className="btn btn-outline-primary" type="submit">Search</button>
                </form>
            </div>
        </nav>
    );
}
export default Navbar;

