import "../styles/Milk";
import { h } from "hyperapp";
import { CurrentTime } from "./CurrentTime";
import { TimeSelect } from "./TimeSelect";
import { MilkAmountSelect } from "./MilkAmountSelect";

export const Milk = ({ state, actions }) => (
  <form className="milk">
    <label className="milk__field">
      <span>開始時刻</span>
      <CurrentTime/>
    </label>
    <label className="milk__field">
      <span>時間</span>
      <TimeSelect/>
    </label>
    <label className="milk__field">
      <span>量</span>
      <MilkAmountSelect/>
    </label>
    <input className="milk__submit" type="submit"/>
  </form>
)
