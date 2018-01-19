import "styles/components/BreastMilk";
import { h } from "hyperapp";
import { Breasts } from "components/Breasts";
import { CurrentTime } from "components/CurrentTime";
import { TimeSelect } from "components/TimeSelect";
import { Urls } from "constants/Urls.js.erb";
import { sendRequestFromForm } from "requests/sendRequestFromForm";

export const BreastMilk = ({ actions: { done, resetDone }, state }) => (
  <form
    action={Urls.createBreastMilkLog.path}
    className="breast-milk"
    method={Urls.createBreastMilkLog.method}
    onsubmit={async e => {
      e.preventDefault();
      try {
        resetDone();
        await sendRequestFromForm(e.target);
        done();
      } catch (reason) {
        alert(`エラーが発生しました ${reason}`);
      }
    }}
  >
    <label className="breast-milk__field">
      <Breasts name="side" />
    </label>
    <label className="breast-milk__field">
      <span>開始時刻</span>
      <CurrentTime name="started_at" />
    </label>
    <label className="breast-milk__field">
      <span>時間</span>
      <TimeSelect name="duration_min" />
    </label>
    <input
      className="breast-milk__submit"
      type="submit"
      value="🤱記録"
      disabled={!state.done}
    />
  </form>
);
