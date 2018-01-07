import "../styles/Poo";
import { h } from "hyperapp";
import { CurrentTime } from "./CurrentTime";
import { PooColor } from "./PooColor";
import { DiaperUsage } from "./DiaperUsage";

export const Poo = ({ state, actions }) => (
  <form className="poo">
    <label className="poo__field">
      <span>時刻</span>
      <CurrentTime/>
    </label>
    <label className="poo__field">
      <span>色</span>
      <PooColor/>
    </label>
    <label className="poo__field">
      <span>量</span>
      <DiaperUsage unit="💩"/>
    </label>
    <input className="poo__submit" type="submit" value="💩記録"/>
  </form>
)
