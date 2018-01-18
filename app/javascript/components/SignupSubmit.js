import "styles/components/SignupSubmit";
import { h } from "hyperapp";

export const SignupSubmit = ({ state: { valid } }) => (
  <input
    className="signup-submit"
    type="submit"
    value="👶登録"
    disabled={!valid}
  />
);
