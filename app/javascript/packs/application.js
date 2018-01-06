import "../styles/application";
import { actions, state, view } from "baby-logs";
import { h, app } from "hyperapp";

app(state, actions, view, document.body);
