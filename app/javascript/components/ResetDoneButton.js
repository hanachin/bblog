import "styles/components/ResetDoneButton";
import { h } from "hyperapp";

export const ResetDoneButton = ({ actions: { resetDone } }) => (
  <button
    className="reset-done-button"
    onclick={e => {
      e.preventDefault();
      resetDone();
    }}
  >
    戻る
  </button>
);
