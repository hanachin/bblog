import { h } from "hyperapp";
import { sendSigninOrSignupEmail } from "requests/sendSigninOrSignupEmail";

export const SigninOrSignupForm = (
  { state: { email }, actions: { done, invalidate, updateEmail, validate } },
  children
) => (
  <form
    className="signin-or-signup-form"
    onsubmit={async e => {
      e.preventDefault();
      try {
        invalidate();
        await sendSigninOrSignupEmail(email);
        updateEmail("");
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
