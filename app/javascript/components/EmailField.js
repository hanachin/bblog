import "styles/components/EmailField";
import { h } from "hyperapp";

export const EmailField = ({ name, actions: { invalidate, validate } }) => (
  <label className="email-field">
    <span>メールアドレス</span>
    <input
      name={name}
      type="email"
      onchange={e => (e.target.validity.valid ? validate() : invalidate())}
      required
    />
  </label>
);
