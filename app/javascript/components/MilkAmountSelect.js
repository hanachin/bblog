import "styles/components/MilkAmountSelect";
import { h } from "hyperapp";

export const MilkAmountSelect = () => (
  <select className="milk-amount-select">
    {Array.from(Array(100).keys()).map(i => (
      <option value={(i + 1) * 10}>{(i + 1) * 10}ml</option>
    ))}
  </select>
);
