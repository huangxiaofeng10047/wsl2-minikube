import React from 'react';
import './App.css';

function FormattedDate(props) {
    return <h2>现在是 {props.date.toLocaleTimeString()}.</h2>;
  }
   
  class Clock5 extends React.Component {
    constructor(props) {
      super(props);
      this.state = {date: new Date()};
    }
   
    componentDidMount() {
      this.timerID = setInterval(
        () => this.tick(),
        1000
      );
    }
   
    componentWillUnmount() {
      clearInterval(this.timerID);
    }
   
    tick() {
      this.setState({
        date: new Date()
      });
    }
   
    render() {
      return (
        <div className="App">
                  <header className="App-header">
         <h1>Hello, clock5!</h1>
          <FormattedDate date={this.state.date} />
          </header>
        </div>
      );
    }
  }
function Clock4() {
    return (
        <div>
          <Clock5 />
          <Clock5 />
          <Clock5 />
        </div>
      );
}

export default Clock4;
