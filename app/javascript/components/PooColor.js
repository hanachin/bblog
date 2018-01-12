import "styles/components/PooColor";
import { h } from "hyperapp";

export const PooColor = () => (
  <div className="poo-color">
    {Array.from(Array(7).keys()).map(n => (
      <input name="poo-color" type="radio" value={n + 1} />
    ))}
  </div>
);
