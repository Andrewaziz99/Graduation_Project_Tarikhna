import "./Login.css"
import { Link } from "react-router-dom";
function LoginPage() {


    return (
        <div className="page">
            <div class="wrapper">
                <form action="#">
                    <h2>Login</h2>
                    <div class="input-field">
                        <input type="text" required />
                        <label>Enter your email</label>
                    </div>
                    <div class="input-field">
                        <input type="password" required />
                        <label>Enter your password</label>
                    </div>
                    <div class="forget">
                        <label for="remember">
                            <input type="checkbox" id="remember" />
                            <p>Remember me</p>
                        </label>
                        <a href="#">Forgot password?</a>
                    </div>
                    <Link to='/home' className="buttonLogin">
                        <button>Login</button> </Link>
                    <div class="register">
                        <p>Don't have an account? <Link to="/register">Register</Link></p>
                    </div>
                </form>
            </div>
        </div>
    );
}
export default LoginPage;