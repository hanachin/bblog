import "styles/components/Logs";
import { h } from "hyperapp";

export const Logs = ({ state: { logs }, actions }) => (
  <div>
    {Object.keys(logs)
      .sort()
      .reverse()
      .map(d => [
        <h1>{d}</h1>,
        <ul className="logs">{logs[d].map(log => <li>{log}</li>)}</ul>
      ])}
  </div>
);
