import React from 'react';
import logo from './logo.svg';
import './App.css';
function MyButton() {
  return (
    <button>
      I'm a button
    </button>
  );
}
const user = {
  name: 'Hedy Lamarr',
  imageUrl: 'https://i.imgur.com/yXOvdOSs.jpg',
  imageSize: 90,
};
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
          
              <h1>{user.name}</h1>
      
        </a>
        <img
        className="avatar"
        src={user.imageUrl}
        alt={'Photo of ' + user.name}
        style={{
          width: user.imageSize,
          height: user.imageSize
        }}
      />
    </header>
    </div>
  );
}

export default App;
