import { h } from "hyperapp";
import { logTypes } from "./logTypes";
import { Header } from "./components/Header";
import { Main } from "./components/Main";

export const actions = {
  changeLogType: logType => state => ({ ...state, logType })
};
export const state = { logType: logTypes[0] };

/* TODO replace with fragment
export default (state, actions) => (
  <>
    <Header state={state} actions={actions}/>
    <Main state={state} actions={actions}/>
  </>
)
*/
export const view = (state, actions) => (
  <div>
    <Header state={state} actions={actions} />
    <Main state={state} actions={actions} />
  </div>
);
