import React, { Component } from 'react'

class Band extends Component{
  constructor(props) {
    super(props);
    this.state{
      band: {},
      userID: null,
      musicians: []
    }
  }

  componentDidMount() {
    let bandId = this.props.params.id
    fetch(`/api/v1/bands/${bandId}`)
      .then(response => {
        if (response.ok){
          return response;
        }else {
          let errorMessage = `${response.status}(${response.statusText})` ,
          error = new Error(errorMessage);
          throw(error);
        }
      })
      .then(response => response.json())
      .then(response => {
        let band = response.band
        this.setState( {
          band: band,
          userID: band.user_id,
          musicians: band.musicians
        })
      })
      .catch(error => console.error(`Error in fetch: ${error.message}`));
  }

  render() {

    if (this.state.band.musicians){
      musicians = this.state.musicians.map(musician => {
        return (
          <Musician
            //passdown data
          />
        )
      })
      if (this.state.band.musicians.length > 0) {
        membersHeaderText = "Members:"
      }
    }

    return (
      <div>
        <h1>{this.state.band.name}</h1>
          <h4>Scene:</h4>
            <p>{this.state.band.scene}</p>
          <h4>Style:</h4>
            <p>{this.state.band.genre}</p>
          <h3>{membersHeaderText}</h3>
            { musicians }
      </div>
    )
  }
}

export default App
