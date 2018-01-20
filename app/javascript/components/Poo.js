import "styles/components/Poo";
import { h } from "hyperapp";
import { CurrentTime } from "components/CurrentTime";
import { DiaperUsage } from "components/DiaperUsage";
import { LoggingSplash, waitLoggingSplash } from "components/LoggingSplash";
import { PooColor } from "components/PooColor";
import { Urls } from "constants/Urls.js.erb";
import { sendRequestFromForm } from "requests/sendRequestFromForm";

export const Poo = ({ actions: { done, resetDone }, state }) => (
  <form
    action={Urls.createPooLog.path}
    className="poo"
    method={Urls.createPooLog.method}
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
    <label className="poo__field">
      <span>時刻</span>
      <CurrentTime name="started_at" />
    </label>
    <label className="poo__field">
      <span>色</span>
      <PooColor name="color" />
    </label>
    <label className="poo__field">
      <span>量</span>
      <DiaperUsage name="diaper_usage" unit="💩" />
    </label>
    <input
      className="poo__submit"
      type="submit"
      value="💩記録"
      disabled={!state.done}
    />
    <LoggingSplash done={state.done} logType="💩" />
  </form>
);
