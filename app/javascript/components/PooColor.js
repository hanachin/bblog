import "styles/components/PooColor";
import { h } from "hyperapp";

export const PooColor = ({ name }) => (
  <div className="poo-color">
    {Array.from(Array(7).keys()).map(n => (
      <input
        name={name}
        type="radio"
        value={n + 1}
        className="poo-color__color"
      />
    ))}
  </div>
);
