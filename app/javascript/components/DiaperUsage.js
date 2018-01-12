import "styles/components/DiaperUsage";
import { h } from "hyperapp";

export const DiaperUsage = ({ name, unit }) => (
  <div className="diaper-usage">
    <input
      name={name}
      type="radio"
      value="little"
      data-diaper-usage-content={unit}
      className={`diaper-usage__little diaper-usage__little--${name}`}
    />
    <input
      name={name}
      type="radio"
      value="much"
      data-diaper-usage-content={unit + unit + unit}
      className={`diaper-usage__much diaper-usage__much--${name}`}
    />
  </div>
);
