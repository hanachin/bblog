import { h } from "hyperapp";
import { sendSigninOrSignupEmail } from "requests/sendSigninOrSignupEmail";

export const SigninOrSignupForm = (
  { state: { email }, actions: { done, invalidate, updateForm, validate } },
  children
) => (
  <form
    className="signin-or-signup-form"
    onsubmit={async e => {
      e.preventDefault();
      try {
        invalidate();
        await sendSigninOrSignupEmail(email);
        updateForm("email", "");
        done();
      } catch (reason) {
        alert(`エラーが発生しました ${reason}`);
        validate();
      }
    }}
  >
    {children}
  </form>
);
