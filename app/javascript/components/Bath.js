import "styles/components/Bath";
import { h } from "hyperapp";
import { CurrentTime } from "components/CurrentTime";
import { TimeSelect } from "components/TimeSelect";

export const Bath = ({ state, actions }) => (
  <form className="bath">
    <label className="bath__field">
      <span>時刻</span>
      <CurrentTime name="started_at" />
    </label>
    <label className="bath__field">
      <span>時間</span>
      <TimeSelect name="duration_min" />
    </label>
    <input className="bath__submit" type="submit" value="🛀記録" />
  </form>
);
