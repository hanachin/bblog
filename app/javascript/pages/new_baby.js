import "styles/pages/new_baby";
import { h } from "hyperapp";
import { SignupForm } from "components/SignupForm";
import { SignupThanks } from "components/SignupThanks";
import { signup } from "actions/signup";
import { updateForm } from "actions/updateForm";
export { signupFormState as state } from "states/signupFormState";
import { resetDone } from "actions/resetDone";

export const actions = { signup, updateForm, resetDone };

export const view = (state, actions) => (
  <div>
    <h1>bblog</h1>
    {!state.done && <SignupForm state={state} actions={actions} />}
    {state.done && <SignupThanks actions={actions} />}
  </div>
);
