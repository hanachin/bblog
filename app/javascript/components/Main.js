import { h } from "hyperapp";
import { Bath } from "components/Bath";
import { BreastMilk } from "components/BreastMilk";
import { Logs } from "components/Logs";
import { Milk } from "components/Milk";
import { Pee } from "components/Pee";
import { Poo } from "components/Poo";

export const Main = ({ state, actions }) => (
  <main>
    {state.logType === "👶" && <Logs state={state} actions={actions} />}
    {state.logType === "🤱" && (
      <BreastMilk state={state.breastMilk} actions={actions.breastMilk} />
    )}
    {state.logType === "🍼" && (
      <Milk state={state.milk} actions={actions.milk} />
    )}
    {state.logType === "💩" && <Poo state={state} actions={actions} />}
    {state.logType === "💧" && <Pee state={state} actions={actions} />}
    {state.logType === "🛀" && (
      <Bath state={state.bath} actions={actions.bath} />
    )}
  </main>
);
