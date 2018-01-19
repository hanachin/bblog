import "styles/components/Poo";
import { h } from "hyperapp";
import { CurrentTime } from "components/CurrentTime";
import { PooColor } from "components/PooColor";
import { DiaperUsage } from "components/DiaperUsage";

export const Poo = ({ state, actions }) => (
  <form className="poo">
    <label className="poo__field">
      <span>時刻</span>
      <CurrentTime name="started_at" />
    </label>
    <label className="poo__field">
      <span>色</span>
      <PooColor name="color" />
    </label>
    <label className="poo__field">
      <span>量</span>
      <DiaperUsage name="diaper_usage" unit="💩" />
    </label>
    <input className="poo__submit" type="submit" value="💩記録" />
  </form>
);
