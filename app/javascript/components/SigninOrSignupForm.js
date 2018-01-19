import { h } from "hyperapp";
import { sendSigninOrSignupEmail } from "requests/sendSigninOrSignupEmail";

export const SigninOrSignupForm = (
  { actions: { done, invalidate, validate } },
  children
) => (
  <form
    className="signin-or-signup-form"
    onsubmit={async e => {
      e.preventDefault();
      try {
        invalidate();
        await sendSigninOrSignupEmail(new FormData(e.target));
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
