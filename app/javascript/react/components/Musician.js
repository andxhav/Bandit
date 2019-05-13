import React, { Component } from 'react'
import { Router, Route } from 'react-router'
import App from './App'

class Musician extends Component{
  constructor(props) {
    super(props);
    this.clickMusicianState = this.clickMusicianState.bind(this)
    this.handleMusicianState = this.handleMusicianState.bind(this)
    this.state = {
      musician: {},
      userID: null,
      musicianState: null,
      stateClass: null
    };
  }

  componentDidMount() {
    let musicianId = this.props.params.id
    fetch(`/api/v1/musicians/${musicianId}`)
      .then(response => {
        if (response.ok){
          console.log(response)
          console.log(musicianId)
          return response;
        }else {
          let errorMessage = `${response.status}(${response.statusText})` ,
          error = new Error(errorMessage);
          throw(error);
        }
      })

      .then(response => response.json())
      .then(response => {
        let musician = response
        this.setState( {
          musician: musician,
          userID: musician.user_id,
          musicianState: musician.musician_state
        })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }


  handleMusicianState(musicianStateStored){
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
    fetch(`/api/v1/musicians`, {
      method: 'POST',
      body: JSON.stringify({musician_id: this.state.musician.id, musician_state: musicianStateStored}),
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken
      },
      credentials: 'same-origin'
    })
    .then(response => {
      if (response.ok) {
        return response;
      } else {
        let errorMessage = `${response.status}(${response.statusText})` ,
        error = new Error(errorMessage);
        throw(error);
      }
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  clickMusicianState(){
    let musicianStateStored = this.state.musicianState
    if (musicianStateStored === "open"){
      musicianStateStored = "closed"
      this.setState({
        musicianState: musicianStateStored
      })
      this.handleMusicianState(musicianStateStored)
    } else {
      musicianStateStored = "open"
      this.setState({
        musicianState: musicianStateStored
      })
      this.handleMusicianState(musicianStateStored)
    }
  }


  render() {

    return (

      <div>
        <h1>{this.state.musician.first_name + " " + this.state.musician.last_name }</h1>
          <h4>Scene:</h4>
            <p>{this.state.musician.scene}</p>
          <h4>Home Town:</h4>
            <p>{this.state.musician.home_town}</p>
          <h4>About Me:</h4>
            <p>{this.state.musician.bio}</p>
          <h4>Instruments:</h4>
            <p>{this.state.musician.instruments}</p>
          <h4>Musician State:</h4>
            <a class={this.state.stateClass} onClick={this.clickMusicianState}>
              {this.state.musicianState}
            </a>

      </div>
    )
  }
}

export default Musician
