import "../styles/main";
import { h } from "hyperapp";
import { BreastMilk } from "./BreastMilk";

export const Main = ({ state, actions }) => (
  <main className="log">
    <div className="log__current-log-type">{state.logType}</div>
    {state.logType === '🤱' && <BreastMilk state={state} actions={actions} />}
  </main>
)
