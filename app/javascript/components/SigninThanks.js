import "styles/components/SigninThanks";
import { h } from "hyperapp";
import { ResetDoneButton } from "components/ResetDoneButton";

export const SigninThanks = ({ actions }) => (
  <p>
    <span>
      入力されたメールアドレスにログイン用のURLを送りました。ご確認ください。
    </span>
    <ResetDoneButton actions={actions} />
  </p>
);
