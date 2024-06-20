import React from "react";
import "bootstrap/dist/css/bootstrap.min.css"
import "bootstrap-icons/font/bootstrap-icons.css"
import "bootstrap/js/dist/dropdown"
import "./Sidebar.css"
import { Link } from "react-router-dom";
function SidebarMenu() {
    return (
        <div className="container sidenav">
            <div className="row">
                <div className="sidenav-item col-auto col-md-2 min-vh-100 d-flex justify-content-between flex-column">
                    <div>
                        <ul className="nav nav-pills flex-column mt-3 mt-sm-2">
                            <li className="nav-item text-black fs-4 my-1 py-2 py-sm-0">
                                <Link to="/" className="nav-link text-black fs-5" aria-current="page">
                                    <i className="bi bi-house"></i>
                                    <span className="ms-3 d-none d-sm-inline ">Home</span>
                                </Link>
                            </li>
                            <li className="nav-item text-black fs-4 my-1 py-2 py-sm-0">
                                <Link to="/questions" className="nav-link text-black fs-5" aria-current="page">
                                    <i className="bi bi-speedometer2"></i>
                                    <span className="ms-3 d-none d-sm-inline ">Questions</span>
                                </Link>
                            </li>
                            <li className="nav-item text-black fs-4 my-1 py-2 py-sm-0">
                                <Link to="/lesson" className="nav-link text-black fs-5" aria-current="page">
                                    <i className="bi bi-table"></i>
                                    <span className="ms-3 d-none d-sm-inline ">Lessons</span>
                                </Link>
                            </li>
                        </ul></div>
                    {/* <div class="dropdown open">
                        <a
                            class="text-decoration-none text-black dropdown-toggle p-3"
                            type="button"
                            id="triggerId"
                            data-bs-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                        ><i className="bi bi-person-circle"></i>
                            <span className="ms-2 d-none d-sm-inline">Admin</span>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="triggerId">
                            <a class="dropdown-item" href="#">Admin Profile</a>
                            <a class="dropdown-item " href="#">Log Out</a>
                        </div>
                    </div> */}
                </div>
            </div>
        </div>
    );
}
export default SidebarMenu;