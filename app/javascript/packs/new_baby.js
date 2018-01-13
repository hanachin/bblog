import { h, app } from "hyperapp";
import { actions, state, view } from "pages/new_baby";

app(state, actions, view, document.body);
