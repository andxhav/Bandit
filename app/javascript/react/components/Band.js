import React, { Component } from 'react'
import { Router, Route } from 'react-router'
import App from './App'

class Band extends Component{
  constructor(props) {
    super(props);
    this.state = {
      band: {},
      bandPhotoURL: ""
    };
  }

  componentDidMount() {
    let bandId = this.props.params.id
    fetch(`/api/v1/bands/${bandId}`)
      .then(response => {
        if (response.ok){
          console.log(response)
          console.log("test")
          return response;
        }else {
          let errorMessage = `${response.status}(${response.statusText})` ,
          error = new Error(errorMessage);
          throw(error);
        }
      })

      .then(response => response.json())
      .then(response => {
        let band = response
        this.setState( {
          band: band,
          bandPhotoURL: band.band_photo.url
        })
          console.log(this.state)
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {

    return (
    <div>
      <div className="profile-info">
        <h1>{this.state.band.band_name}</h1>
          <h4>Scene:</h4>
            <p>{this.state.band.scene}</p>
          <h4>Style:</h4>
            <p>{this.state.band.genre}</p>
          <h4>About the Band:</h4>
            <p>{this.state.band.bio}</p>
      </div>
      <div className="profile-info">
        <img src={this.state.bandPhotoURL}/>
      </div>
    </div>
    )
  }
}

export default Band
