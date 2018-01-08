import { h } from "hyperapp";
import { Bath } from "./Bath";
import { BreastMilk } from "./BreastMilk";
import { Logs } from "./Logs";
import { Milk } from "./Milk";
import { Pee } from "./Pee";
import { Poo } from "./Poo";

export const Main = ({ state, actions }) => (
  <main>
    {state.logType === '👶' && <Logs state={state} actions={actions} />}
    {state.logType === '🤱' && <BreastMilk state={state} actions={actions} />}
    {state.logType === '🍼' && <Milk state={state} actions={actions} />}
    {state.logType === '💩' && <Poo state={state} actions={actions} />}
    {state.logType === '💧' && <Pee state={state} actions={actions} />}
    {state.logType === '🛀' && <Bath state={state} actions={actions} />}
  </main>
)
