import "../styles/TimeSelect.sass";
import { h } from "hyperapp";

export const TimeSelect = () => (
  <select className="time-select" value="10">
    {Array.from(Array(60).keys()).map((n) => <option value={n + 1}>{n + 1}</option>)}
  </select>
)
