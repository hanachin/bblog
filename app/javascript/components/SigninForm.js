import "styles/components/SigninForm";
import { h } from "hyperapp";
import { sendSigninEmail } from "requests/sendSigninEmail";

export const SigninForm = ({
  state,
  actions: { done, updateForm }
}) => {
  const { email, valid } = state;
  return (
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
    <label className="signin-form__field">
      <span>メールアドレス</span>
      <input
        name="email"
        type="email"
        onchange={e =>
          updateForm({
            name: e.target.name,
            value: e.target.value,
            valid: e.target.validity.valid
          })
        }
        required
      />
    </label>
    <input
      className="signin-form__submit"
      type="submit"
      value="👶ログイン"
      disabled={!valid}
    />
  </form>
)};
