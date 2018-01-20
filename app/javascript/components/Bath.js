import "styles/components/Bath";
import { h } from "hyperapp";
import { CurrentTime } from "components/CurrentTime";
import { LoggingSplash, waitLoggingSplash } from "components/LoggingSplash";
import { TimeSelect } from "components/TimeSelect";
import { Urls } from "constants/Urls.js.erb";
import { sendRequestFromForm } from "requests/sendRequestFromForm";

export const Bath = ({ actions: { done, resetDone }, state }) => (
  <form
    action={Urls.createBathLog.path}
    className="bath"
    method={Urls.createBathLog.method}
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
    <label className="bath__field">
      <span>時刻</span>
      <CurrentTime name="started_at" />
    </label>
    <label className="bath__field">
      <span>時間</span>
      <TimeSelect name="duration_min" />
    </label>
    <input
      className="bath__submit"
      type="submit"
      value="🛀記録"
      disabled={!state.done}
    />
    <LoggingSplash done={state.done} logType="🛀" />
  </form>
);
