import "styles/components/Milk";
import { h } from "hyperapp";
import { CurrentTime } from "components/CurrentTime";
import { TimeSelect } from "components/TimeSelect";
import { MilkAmountSelect } from "components/MilkAmountSelect";

export const Milk = ({ state, actions }) => (
  <form className="milk">
    <label className="milk__field">
      <span>開始時刻</span>
      <CurrentTime />
    </label>
    <label className="milk__field">
      <span>時間</span>
      <TimeSelect />
    </label>
    <label className="milk__field">
      <span>量</span>
      <MilkAmountSelect />
    </label>
    <input className="milk__submit" type="submit" value="🍼記録" />
  </form>
);
