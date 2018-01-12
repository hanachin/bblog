import { h, app } from "hyperapp";
import { actions, state, view } from "pages/baby_logs";

app(state, actions, view, document.body);
