import "styles/components/Header";
import { h } from "hyperapp";
import { LogTypes } from "constants/LogTypes";
import { getBabyLogs } from "requests/getBabyLogs";

export const Header = ({ state, actions: { changeLogType, loadLogs } }) => (
  <header>
    <nav>
      <ul className="log-types">
        {LogTypes.map(t => (
          <li
            className={`log-types__log-type ${t == state.logType &&
              "log-types__log-type--current"}`}
            onclick={() => {
              changeLogType(t);
              if (t !== "👶") {
                return;
              }
              (async () => {
                const logs = await getBabyLogs(new Date());
                loadLogs(logs);
              })();
            }}
          >
            <span>{t}</span>
          </li>
        ))}
      </ul>
    </nav>
  </header>
);
