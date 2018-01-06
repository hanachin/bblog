import "../styles/CurrentTime.sass";
import { h } from "hyperapp";

export const CurrentTime = () => (
  <input className="current-time" type="time" value={`${new Date().getHours()}:${new Date().getMinutes()}`}/>
)
