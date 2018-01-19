import "styles/pages/baby_logs";
import { h } from "hyperapp";
import { Header } from "components/Header";
import { Main } from "components/Main";
import { changeLogType } from "actions/changeLogType";
import { done } from "actions/done";
import { loadLogs } from "actions/loadLogs";
import { resetDone } from "actions/resetDone";

export { babyLogsState as state } from "states/babyLogsState";

export const actions = {
  changeLogType,
  loadLogs,
  bath: { done, resetDone },
  breastMilk: { done, resetDone },
  milk: { done, resetDone }
};

export const view = (state, actions) => (
  <div>
    <Header state={state} actions={actions} />
    <Main state={state} actions={actions} />
  </div>
);
