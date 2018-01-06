import "../styles/application.sass";
import { actions, state, view } from "baby-logs";
import { h, app } from "hyperapp";

app(state, actions, view, document.body);
