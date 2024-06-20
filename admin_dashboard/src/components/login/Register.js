import "./Login.css"
import { Link } from "react-router-dom";
function RegisterPage() {


    return (
        <div className="page">
            <div class="wrapper">
                <form action="#">
                    <h2>Register</h2>
                    <div class="input-field">
                        <input type="text" required />
                        <label>Enter your Username</label>
                    </div>
                    <div class="input-field">
                        <input type="text" required />
                        <label>Enter your email</label>
                    </div>
                    <div class="input-field">
                        <input type="password" required />
                        <label>Enter your password</label>
                    </div>
                    <div class="input-field">
                        <input type="password" required />
                        <label>Confirm your password</label>
                    </div>
                    <Link to="/">
                        <button >Register</button></Link>

                </form>
            </div>
        </div>
    );
}
export default RegisterPage;