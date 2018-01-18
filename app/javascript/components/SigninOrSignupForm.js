import { h } from "hyperapp";
import { sendSigninOrSignupEmail } from "requests/sendSigninOrSignupEmail";

export const SigninOrSignupForm = (
  { state: { email }, actions: { done } },
  children
) => (
  <form
    className="signin-or-signup-form"
    onsubmit={e => {
      e.preventDefault();
      sendSigninOrSignupEmail(email).then(
        () => done(),
        reason => alert(`エラーが発生しました ${reason}`)
      );
    }}
  >
    {children}
  </form>
);
