import "../styles/PooColor";
import { h } from "hyperapp";

export const PooColor = () => (
  <div className="poo-color">
    {Array.from(Array(7).keys()).map(n => <div>{n+1}</div>)}
  </div>
)
