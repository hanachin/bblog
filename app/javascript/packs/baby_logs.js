import "babel-polyfill";
import { h, app } from "hyperapp";
import { actions, state, view } from "pages/baby_logs";
import { getBabyLogs } from "requests/getBabyLogs";

const App = app(state, actions, view, document.body);

(async () => {
  const logs = await getBabyLogs(new Date());
  App.loadLogs(logs);
})();
