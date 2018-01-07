import "../styles/BreastMilk";
import { h } from "hyperapp";
import { CurrentTime } from "./CurrentTime";
import { TimeSelect } from "./TimeSelect";

export const BreastMilk = ({ state, actions }) => (
  <form className="breast-milk">
    <label className="breast-milk__field">
      <span>開始時刻</span>
      <CurrentTime/>
    </label>
    <label className="breast-milk__field">
      <span>時間</span>
      <TimeSelect/>
    </label>
    <input className="breast-milk__submit" type="submit" value="🤱記録"/>
  </form>
)
