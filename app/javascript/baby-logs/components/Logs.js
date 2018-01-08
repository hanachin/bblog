import "../styles/Logs";
import { h } from "hyperapp";
import { logTypes } from "../logTypes";

export const Logs = ({ state: { logs }, actions }) => (
  <div>
    {
      Object.keys(logs).map(d => [
        <h1>{d}</h1>,
        <ul className="logs">
          {logs[d].map(log => <li>{log}</li>)}
        </ul>
      ])
    }
  </div>
)
