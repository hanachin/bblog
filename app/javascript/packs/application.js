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
        <ul>
          {logTypes.map(t => <li onclick={() => actions.changeLogType(t)}>{t}</li>)}
        </ul>
      </nav>
    </header>
    <main>{state.logType}</main>
  </div>
)
app(state, actions, view, document.body)
