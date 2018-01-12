import "styles/components/Bath";
import { h } from "hyperapp";
import { CurrentTime } from "components/CurrentTime";
import { TimeSelect } from "components/TimeSelect";

export const Bath = ({ state, actions }) => (
  <form className="bath">
    <label className="bath__field">
      <span>時刻</span>
      <CurrentTime />
    </label>
    <label className="bath__field">
      <span>時間</span>
      <TimeSelect />
    </label>
    <input className="bath__submit" type="submit" value="🛀記録" />
  </form>
);
