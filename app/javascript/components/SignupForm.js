import "styles/components/SignupForm";
import { h } from "hyperapp";
import { sendVerificationEmail } from "requests/sendVerificationEmail";

export const SignupForm = ({
  state: { email, valid },
  actions: { signup, updateForm }
}) => (
  <form
    className="signup-form"
    onsubmit={e => {
      e.preventDefault();
      sendVerificationEmail(email).then(
        () => signup(),
        reason => alert(`エラーが発生しました ${reason}`)
      );
    }}
  >
    <label className="signup-form__field">
      <span>メールアドレス</span>
      <input
        name="email"
        type="email"
        onchange={e =>
          updateForm({
            name: e.target.name,
            value: e.target.value,
            valid: e.target.form.checkValidity()
          })
        }
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
