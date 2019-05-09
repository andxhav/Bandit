import React, { Component } from 'react'
import { Router, Route } from 'react-router'
import App from './App'

class Musician extends Component{
  constructor(props) {
    super(props);
    this.state = {
      musician: {},
      userID: null
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
          userID: musician.user_id
        })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
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
      </div>
    )
  }
}

export default Musician
