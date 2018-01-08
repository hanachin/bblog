import "../styles/Breasts";
import { h } from "hyperapp";

export const Breasts = ({ name, unit }) => (
  <div className="breasts">
    <input
      name="breasts"
      type="radio"
      value="left"
      className="breasts__left"
    />
    <input
      name="breasts"
      type="radio"
      value="right"
      className="breasts__right"
    />
  </div>
)
