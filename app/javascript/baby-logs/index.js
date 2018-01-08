import { h } from "hyperapp";
import { logTypes } from "./logTypes";
import { Header } from "./components/Header";
import { Main } from "./components/Main";

export const actions = {
  changeLogType: logType => state => ({ ...state, logType })
};
export const state = {
  logType: logTypes[0],
  logs: {
    "2018/1/1": [
      "🤱 19:10 左 10分",
      "🍼 18:05 9分 120ml",
      "💩 15:45 💩💩💩",
      "💧 10:20 💧",
      "🛀 09:10 10分"
    ],
    "2017/12/31": ["🤱 23:10 左 10分", "💩 22:45 💩💩💩", "🍼 21:05 9分 120ml"]
  }
};

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
