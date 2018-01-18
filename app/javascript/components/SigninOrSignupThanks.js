import { h } from "hyperapp";
import { ResetDoneButton } from "components/ResetDoneButton";

export const SigninOrSignupThanks = ({ actions }) => (
  <p>
    <span>入力されたメールアドレスにURLを送りました。ご確認ください。</span>
    <ResetDoneButton actions={actions} />
  </p>
);
