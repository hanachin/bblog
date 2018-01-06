import "../styles/BreastMilk.sass";
import { h } from "hyperapp";

const CurrentTime = () => (
  <input className="current-time" type="time" value={`${new Date().getHours()}:${new Date().getMinutes()}`}/>
)

const TimeSelect = () => (
  <select className="time-select" value="10">
    {Array.from(Array(60).keys()).map((n) => <option value={n + 1}>{n + 1}</option>)}
  </select>
)


export const BreastMilk = ({ state, actions }) => (
  <form className="breast-milk">
    <label className="breast-milk__field">
      <span>開始時刻</span>
      <CurrentTime/>
    </label>
    <label className="breast-milk__field">
      <span>時間(分)</span>
      <TimeSelect/>
    </label>
    <input className="breast-milk__submit" type="submit"/>
  </form>
)
