import "styles/components/Breasts";
import { h } from "hyperapp";

export const Breasts = ({ name, unit }) => (
  <div className="breasts">
    <input name={name} type="radio" value="left" className="breasts__left" />
    <input name={name} type="radio" value="right" className="breasts__right" />
  </div>
);
