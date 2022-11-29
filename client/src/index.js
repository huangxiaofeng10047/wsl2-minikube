import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';
import Clock4 from './Clock4';

function tick() {
ReactDOM.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
  document.getElementById('root')
);}
setInterval(tick, 1000);

ReactDOM.render(
  <React.StrictMode>
    <Clock4 />
  </React.StrictMode>,
  document.getElementById('clock4')
);
// ReactDOM.render(
//   <div>
//     <h1>{1+1}</h1>
//   </div>
//   ,
//   document.getElementById('example')
// );
// var i = 1;
// ReactDOM.render(
//   <div>
//     <h1>{i == 1 ? 'True!' : 'False'}</h1>
//   </div>
//   ,
//   document.getElementById('example')
// );
// var myStyle = {
//   fontSize: 100,
//   color: '#FF0000'
// };
// ReactDOM.render(
//   <h1 style = {myStyle}>菜鸟教程</h1>,
//   document.getElementById('example')
// );
//数组
// var arr = [
//   <h1>菜鸟教程</h1>,
//   <h2>学的不仅是技术，更是梦想！</h2>,
// ];
// ReactDOM.render(
//   <div>{arr}</div>,
//   document.getElementById('example')
// );
//react 组件
// function HelloMessage(props) {
//   return <h1>Hello World!</h1>;
// }

// const element = <HelloMessage />;
// ReactDOM.render(
//   element,
//   document.getElementById('example')
// );
// function HelloMessage(props) {
//   return <h1>Hello {props.name}!</h1>;
// }

// const element = <HelloMessage name="Runoob"/>;

// ReactDOM.render(
//   element,
//   document.getElementById('example')
// );
//复合组件
function Name(props) {
  return <h1>网站名称：{props.name}</h1>;
}
function Url(props) {
  return <h1>网站地址：{props.url}</h1>;
}
function Nickname(props) {
  return <h1>网站小名：{props.nickname}</h1>;
}
function App2() {
  return (
  <div>
      <Name name="菜鸟教程" />
      <Url url="http://www.runoob.com" />
      <Nickname nickname="Runoob" />
  </div>
  );
}

ReactDOM.render(
   <App2 />,
  document.getElementById('example')
);
//react state 状态
class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {date: new Date()};
  }
 
  render() {
    return (
      <div>
        <h1>Hello, world!</h1>
        <h2>现在是 {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}
 
ReactDOM.render(
  <Clock />,
  document.getElementById('clock')
);
class Clock2 extends React.Component {
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
      <div>
        <h1>Hello, world!</h1>
        <h1>下面这个时间会变额：</h1>
        <h2>现在是 {this.state.date.toLocaleTimeString()}.</h2>
      </div>
    );
  }
}
 
ReactDOM.render(
  <Clock2 />,
  document.getElementById('clock2')
);
//clcok3
function FormattedDate(props) {
  return <h2>clock3 现在是 {props.date.toLocaleTimeString()}.</h2>;
}
 
class Clock3 extends React.Component {
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
      <div>
        <h1>Hello, world!</h1>
        <FormattedDate date={this.state.date} />
      </div>
    );
  }
}
 
ReactDOM.render(
  <Clock3 />,
  document.getElementById('clock3')
);
// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
