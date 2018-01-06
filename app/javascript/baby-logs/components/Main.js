import "../styles/main.sass";
import { h } from "hyperapp";

export const Main = ({ state, actions }) => (
  <main className="log">
    <div className="log__current-log-type">{state.logType}</div>
  </main>
)
