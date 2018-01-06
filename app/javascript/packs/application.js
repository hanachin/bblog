import '../styles/application.sass'
import { h, app} from 'hyperapp'

const logTypes = [
  "👶",
  "🤱",
  "🍼",
  "💩",
  "💧",
  "🛀",
]

const changeLogType = logType => state => ({ ...state, logType })
const actions = { changeLogType }
const state = { logType: logTypes[0] }


/* TODO replace with fragment
const view = (state, actions) => (
  <>
    <Header state={state} actions={actions}/>
    <Main state={state} actions={actions}/>
  </>
)
app(state, actions, view, document.body)
*/
const view = (state, actions) => (
  <div>
    <header>
      <nav>
        <ul className="log-types">
          {logTypes.map(t => (
            <li className={`log-types__log-type ${t == state.logType && "log-types__log-type--current"}`} onclick={() => actions.changeLogType(t)}><span>{t}</span></li>
          ))}
        </ul>
      </nav>
    </header>
    <main className="log">
      <div className="log__current-log-type">{state.logType}</div>
    </main>
  </div>
)
app(state, actions, view, document.body)
