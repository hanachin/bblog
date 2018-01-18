import "styles/components/SigninForm";
import { h } from "hyperapp";
import { sendSigninEmail } from "requests/sendSigninEmail";

export const SigninForm = (
  { actions: { done }, state: { email } },
  children
) => (
  <form
    className="signin-form"
    onsubmit={e => {
      e.preventDefault();
      sendSigninEmail(email).then(
        () => done(),
        reason => alert(`エラーが発生しました ${reason}`)
      );
    }}
  >
    {children}
  </form>
);
