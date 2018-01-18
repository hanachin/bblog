import "styles/components/EmailField";
import { h } from "hyperapp";

export const EmailField = ({
  actions: { invalidate, updateForm, validate }
}) => (
  <label className="email-field">
    <span>メールアドレス</span>
    <input
      name="email"
      type="email"
      onchange={e => {
        updateForm({ name: e.target.name, value: e.target.value });
        e.target.validity.valid ? validate() : invalidate();
      }}
      required
    />
  </label>
);
