import "../styles/DiaperUsage";
import { h } from "hyperapp";

export const DiaperUsage = ({ unit }) => (
  <div className="diaper-usage">
    <div className="diaper-usage__little">{unit}</div>
    <div className="diaper-usage__much">{unit}{unit}{unit}</div>
  </div>
)
