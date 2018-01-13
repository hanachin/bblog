import "styles/components/Pee";
import { h } from "hyperapp";
import { CurrentTime } from "components/CurrentTime";
import { DiaperUsage } from "components/DiaperUsage";

export const Pee = ({ state, actions }) => (
  <form className="pee">
    <label className="pee__field">
      <span>時刻</span>
      <CurrentTime />
    </label>
    <label className="pee__field">
      <span>量</span>
      <DiaperUsage name="pee" unit="💧" />
    </label>
    <input className="pee__submit" type="submit" value="💧記録" />
  </form>
);