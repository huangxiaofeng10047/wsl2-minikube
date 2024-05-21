import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        {/* <p>
          Edit <code>src/App.js</code> and save to reload.
        </p> */}
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
              <h1>learn react</h1>
              <h1>Hello, world!</h1>,
              <h2>现在是 {new Date().toLocaleTimeString()}.</h2>
          Learn React by hxf
        </a>
      </header>
    </div>
  );
}

export default App;
