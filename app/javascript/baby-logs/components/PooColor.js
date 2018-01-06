import "../styles/PooColor";
import { h } from "hyperapp";

export const PooColor = () => (
  <div>
    {Array.from(Array(7).keys()).map(n => <div className={`poo-color poo-color--${n+1}`}>{n+1}</div>)}
  </div>
)
