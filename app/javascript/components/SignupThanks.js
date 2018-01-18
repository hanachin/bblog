import "styles/components/SignupThanks";
import { h } from "hyperapp";
import { ResetDoneButton } from "components/ResetDoneButton";

export const SignupThanks = ({ actions }) => (
  <p>
    <span>
      入力されたメールアドレスに登録用のURLを送りました。ご確認ください。
    </span>
    <ResetDoneButton actions={actions} />
  </p>
);
