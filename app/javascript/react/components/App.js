import React from 'react'
import { Route, IndexRoute, Router, browserHistory } from 'react-router';

import Band from './Band'
import Musician from './Musician'

export const App = (props) => {
  return (
    <Router history={browserHistory}>
      <Route path="/bands/:id" component={Band}/>
      <Route path="/musicians/:id" component={Musician}/>
    </Router>
  )
}

export default App
