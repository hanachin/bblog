import "styles/components/Milk";
import { h } from "hyperapp";
import { CurrentTime } from "components/CurrentTime";
import { LoggingSplash, waitLoggingSplash } from "components/LoggingSplash";
import { TimeSelect } from "components/TimeSelect";
import { MilkAmountSelect } from "components/MilkAmountSelect";
import { Urls } from "constants/Urls.js.erb";
import { sendRequestFromForm } from "requests/sendRequestFromForm";

export const Milk = ({ actions: { done, resetDone }, state }) => (
  <form
    action={Urls.createMilkLog.path}
    className="milk"
    method={Urls.createMilkLog.method}
    onsubmit={async e => {
      e.preventDefault();
      try {
        resetDone();
        await Promise.all([waitLoggingSplash(), sendRequestFromForm(e.target)]);
        done();
      } catch (reason) {
        alert(`エラーが発生しました ${reason}`);
      }
    }}
  >
    <label className="milk__field">
      <span>開始時刻</span>
      <CurrentTime name="started_at" />
    </label>
    <label className="milk__field">
      <span>時間</span>
      <TimeSelect name="duration_min" />
    </label>
    <label className="milk__field">
      <span>量</span>
      <MilkAmountSelect name="milk_volume_ml" />
    </label>
    <input
      className="milk__submit"
      type="submit"
      value="🍼記録"
      disabled={!state.done}
    />
    <LoggingSplash done={state.done} logType="🍼" />
  </form>
);
