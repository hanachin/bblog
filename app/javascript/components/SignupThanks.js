import "styles/components/SignupThanks";
import { h } from "hyperapp";

export const SignupThanks = ({ actions: { resetDone } }) => (
  <p>
    <span>
      入力されたメールアドレスに登録用のURLを送りました。ご確認ください。
    </span>
    <button
      className="signup-thanks_button"
      onclick={e => {
        e.preventDefault();
        resetDone();
      }}
    >
      戻る
    </button>
  </p>
);
