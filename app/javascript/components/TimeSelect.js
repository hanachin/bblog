import "styles/components/TimeSelect";
import { h } from "hyperapp";

export const TimeSelect = ({ unit = "分" }) => (
  <select className="time-select" value="10">
    {Array.from(Array(60).keys()).map(n => (
      <option value={n + 1}>
        {n + 1}
        {unit}
      </option>
    ))}
  </select>
);
