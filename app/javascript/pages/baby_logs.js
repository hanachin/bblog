import "styles/pages/baby_logs";
import { h } from "hyperapp";
import { Header } from "components/Header";
import { Main } from "components/Main";
import { changeLogType } from "actions/changeLogType";

export { babyLogsState as state } from "states/babyLogsState";

export const actions = { changeLogType };

export const view = (state, actions) => (
  <div>
    <Header state={state} actions={actions} />
    <Main state={state} actions={actions} />
  </div>
);
