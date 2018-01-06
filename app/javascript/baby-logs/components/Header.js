import "../styles/header.sass";
import { h } from "hyperapp";
import { logTypes } from "../logTypes";

export const Header = ({ state, actions }) => (
  <header>
    <nav>
      <ul className="log-types">
        {logTypes.map(t => (
          <li
            className={`log-types__log-type ${t == state.logType &&
            "log-types__log-type--current"}`}
            onclick={() => actions.changeLogType(t)}
            >
            <span>{t}</span>
          </li>
        ))}
  </ul>
    </nav>
    </header>
)
