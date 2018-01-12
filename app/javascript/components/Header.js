import "styles/components/Header";
import { h } from "hyperapp";
import { LogTypes } from "constants/LogTypes";

export const Header = ({ state, actions }) => (
  <header>
    <nav>
      <ul className="log-types">
        {LogTypes.map(t => (
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
);
