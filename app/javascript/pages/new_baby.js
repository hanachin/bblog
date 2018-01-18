import "styles/pages/new_baby";
import { h } from "hyperapp";
import { done } from "actions/done";
import { invalidate } from "actions/invalidate";
import { resetDone } from "actions/resetDone";
import { updateForm } from "actions/updateForm";
import { validate } from "actions/validate";
import { EmailField } from "components/EmailField";
import { SigninOrSignupForm } from "components/SigninOrSignupForm";
import { SigninSubmit } from "components/SigninSubmit";
import { SignupSubmit } from "components/SignupSubmit";
import { SigninOrSignupThanks } from "components/SigninOrSignupThanks";
export {
  signinOrSignupFormState as state
} from "states/signinOrSignupFormState";

export const actions = { done, updateForm, resetDone, validate, invalidate };

export const view = (state, actions) => (
  <div>
    <h1>bblog</h1>
    {!state.done && (
      <SigninOrSignupForm state={state} actions={actions}>
        <EmailField actions={actions} />
        <SignupSubmit state={state} />
        <SigninSubmit state={state} />
      </SigninOrSignupForm>
    )}
    {state.done && <SigninOrSignupThanks actions={actions} />}
  </div>
);
