import "styles/components/LoggingSplash";
import { h } from "hyperapp";

export const waitLoggingSplash = () =>
  new Promise((resolve, reject) => setTimeout(resolve, 1000));

export const LoggingSplash = ({ done, logType }) => (
  <div className={`logging-splash ${done ? "logging-splash--done" : ""}`}>
    <span>{logType}</span>
    <span>{logType}</span>
    <span>{logType}</span>
    <span>{logType}</span>
    <span>{logType}</span>
  </div>
);
