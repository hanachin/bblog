import "styles/pages/new_baby";
import { h } from "hyperapp";
import { SignupForm } from "components/SignupForm";
import { SigninForm } from "components/SigninForm";
import { SignupThanks } from "components/SignupThanks";
import { SigninThanks } from "components/SigninThanks";
import { done } from "actions/done";
import { updateForm } from "actions/updateForm";
import { signupFormState } from "states/signupFormState";
import { signinFormState } from "states/signinFormState";
import { resetDone } from "actions/resetDone";

const SigninOrSignup = { signin: 'signin', signup: 'signup' };

export const actions = {
  signup: { done, updateForm, resetDone },
  signin: { done, updateForm, resetDone },
  toggleSigninSignup: () => state => ({...state, signinOrSignup: (state.signinOrSignup === SigninOrSignup.signin ? SigninOrSignup.signup : SigninOrSignup.signin)})
};

export const state = {
  signinOrSignup: SigninOrSignup.signin,
  signup: signupFormState,
  signin: signinFormState
};

export const view = (state, actions) => (
  <div>
    <h1>bblog</h1>
    <button onclick={actions.toggleSigninSignup}>切り替え</button>
    {state.signinOrSignup === SigninOrSignup.signin && !state.signin.done && <SigninForm state={state.signin} actions={actions.signin} />}
    {state.signinOrSignup === SigninOrSignup.signup && !state.signup.done && <SignupForm state={state.signup} actions={actions.signup} />}
    {state.signinOrSignup === SigninOrSignup.signin && state.signin.done && <SigninThanks actions={actions.signin} />}
    {state.signinOrSignup === SigninOrSignup.signup && state.signup.done && <SignupThanks actions={actions.signup} />}
  </div>
);
