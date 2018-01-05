import '../styles/application.sass'
import { h, app} from 'hyperapp'

const view = (state, actions) => (
  <main>
    <h1>👶🤱🍼💩 </h1>
  </main>
)

app({}, {}, view, document.body)
