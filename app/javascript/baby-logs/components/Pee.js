import "../styles/Pee";
import { h } from "hyperapp";
import { CurrentTime } from "./CurrentTime";
import { DiaperUsage } from "./DiaperUsage";

export const Pee = ({ state, actions }) => (
  <form className="pee">
    <label className="pee__field">
      <span>時刻</span>
      <CurrentTime/>
    </label>
    <label className="pee__field">
      <span>量</span>
      <DiaperUsage/>
    </label>
    <input className="pee__submit" type="submit"/>
  </form>
)
