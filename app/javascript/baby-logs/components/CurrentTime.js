import "../styles/CurrentTime";
import { h } from "hyperapp";

export const CurrentTime = () => {
  const date = new Date();
  const hours = `${date.getHours()}`.padStart(2, '0');
  const minutes = `${date.getMinutes()}`.padStart(2, '0');
  return (
    <input className="current-time" type="time" value={`${hours}:${minutes}`}/>
  );
}
