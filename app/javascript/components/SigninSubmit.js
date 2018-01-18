import "styles/components/SigninSubmit";
import { h } from "hyperapp";

export const SigninSubmit = ({ state: { valid } }) => (
  <input
    className="signin-submit"
    type="submit"
    value="👶ログイン"
    disabled={!valid}
  />
);
