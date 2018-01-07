import { h } from "hyperapp";
import { BreastMilk } from "./BreastMilk";
import { Milk } from "./Milk";
import { Poo } from "./Poo";
import { Pee } from "./Pee";
import { Bath } from "./Bath";

export const Main = ({ state, actions }) => (
  <main>
    {state.logType === '🤱' && <BreastMilk state={state} actions={actions} />}
    {state.logType === '🍼' && <Milk state={state} actions={actions} />}
    {state.logType === '💩' && <Poo state={state} actions={actions} />}
    {state.logType === '💧' && <Pee state={state} actions={actions} />}
    {state.logType === '🛀' && <Bath state={state} actions={actions} />}
  </main>
)
