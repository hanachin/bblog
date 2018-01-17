import "styles/components/SignupForm";
import { h } from "hyperapp";
import { sendVerificationEmail } from "requests/sendVerificationEmail";

export const SignupForm = ({
  state: { email, valid },
  actions: { done, updateForm, validate, invalidate }
}) => (
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
    <label className="signup-form__field">
      <span>メールアドレス</span>
      <input
        name="email"
        type="email"
        onchange={e => {
          updateForm({ name: e.target.name, value: e.target.value });
          e.target.validity.valid ? validate() : invalidate();
        }}
        required
      />
    </label>
    <input
      className="signup-form__submit"
      type="submit"
      value="👶登録"
      disabled={!valid}
    />
  </form>
);
