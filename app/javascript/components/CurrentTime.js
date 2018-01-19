import "styles/components/CurrentTime";
import { h } from "hyperapp";

export const CurrentTime = ({ name }) => {
  const date = new Date();
  const hours = `${date.getHours()}`.padStart(2, "0");
  const minutes = `${date.getMinutes()}`.padStart(2, "0");
  return (
    <input
      name={name}
      className="current-time"
      type="time"
      value={`${hours}:${minutes}`}
    />
  );
};
