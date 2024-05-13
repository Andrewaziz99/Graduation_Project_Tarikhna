import "./Card.css"
import { Link } from "react-router-dom";
function Card(props) {
    return (
        <Link to={props.target} className="card-item">
            <center>
                <img src={props.imagesrc} alt="Card img descriptive" /></center>
            <span className={props.cardClass}>{props.title}</span>
            <h3>{props.description}</h3>
            {/* <div className="arrow">
                <i className="fas fa-arrow-right card-icon"></i>
            </div> */}
        </Link>

    );
}
export default Card;