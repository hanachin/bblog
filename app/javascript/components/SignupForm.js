import "styles/components/SignupForm";
import { h } from "hyperapp";
import { sendVerificationEmail } from "requests/sendVerificationEmail";

export const SignupForm = (
  { state: { email }, actions: { done } },
  children
) => (
  <form
    className="signup-form"
    onsubmit={e => {
      e.preventDefault();
      sendVerificationEmail(email).then(
        () => done(),
        reason => alert(`エラーが発生しました ${reason}`)
      );
    }}
  >
    {children}
  </form>
);
