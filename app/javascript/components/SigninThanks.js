import "styles/components/SigninThanks";
import { h } from "hyperapp";

export const SigninThanks = ({ actions: { resetDone } }) => (
  <p>
    <span>
      入力されたメールアドレスにログイン用のURLを送りました。ご確認ください。
    </span>
    <button
      className="signin-thanks_button"
      onclick={e => {
        e.preventDefault();
        resetDone();
      }}
    >
      戻る
    </button>
  </p>
);
