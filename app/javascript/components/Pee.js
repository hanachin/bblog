import "styles/components/Pee";
import { h } from "hyperapp";
import { CurrentTime } from "components/CurrentTime";
import { DiaperUsage } from "components/DiaperUsage";
import { LoggingSplash, waitLoggingSplash } from "components/LoggingSplash";
import { Urls } from "constants/Urls.js.erb";
import { sendRequestFromForm } from "requests/sendRequestFromForm";

export const Pee = ({ actions: { done, resetDone }, state }) => (
  <form
    action={Urls.createPeeLog.path}
    className="pee"
    method={Urls.createPeeLog.method}
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
    <label className="pee__field">
      <span>時刻</span>
      <CurrentTime name="started_at" />
    </label>
    <label className="pee__field">
      <span>量</span>
      <DiaperUsage name="diaper_usage" unit="💧" />
    </label>
    <input
      className="pee__submit"
      type="submit"
      value="💧記録"
      disabled={!state.done}
    />
    <LoggingSplash done={state.done} logType="💧" />
  </form>
);
