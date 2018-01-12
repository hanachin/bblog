import "styles/components/BreastMilk";
import { h } from "hyperapp";
import { Breasts } from "components/Breasts";
import { CurrentTime } from "components/CurrentTime";
import { TimeSelect } from "components/TimeSelect";

export const BreastMilk = ({ state, actions }) => (
  <form className="breast-milk">
    <label className="breast-milk__field">
      <Breasts />
    </label>
    <label className="breast-milk__field">
      <span>開始時刻</span>
      <CurrentTime />
    </label>
    <label className="breast-milk__field">
      <span>時間</span>
      <TimeSelect />
    </label>
    <input className="breast-milk__submit" type="submit" value="🤱記録" />
  </form>
);
