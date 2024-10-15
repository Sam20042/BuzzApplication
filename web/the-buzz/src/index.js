import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import { ReactBase, App } from './App';
import reportWebVitals from './reportWebVitals';

var ideasList = [];

function init() {
  const doAjax = async () => {
    await fetch(`http://localhost:8080/messages`, {
      method: 'GET',
      headers: {
        'Content-type': 'application/json; charset=UTF-8'
      }
    }).then((response) => {
      // If we get an "ok" message, clear the form
      if (response.ok) {
        return Promise.resolve(response.json());
      }
      // Otherwise, handle server errors with a detailed popup message
      else {
        window.alert(`The server replied not ok: ${response.status}\n` + response.statusText);
      }
      return Promise.reject(response);
    }).then((data) => {
      console.log("loading ideas...");
      for (let i = 0; i < data.mData.length; i++) {
        ideasList[i] = {};
        ideasList[i].id = data.mData[i].mId;
        ideasList[i].likes = data.mData[i].mLikes;
        ideasList[i].message = data.mData[i].mMessage;
      }
      console.log("ideas loaded!");
      console.log(data);
    }).catch((error) => {
      console.warn('Something went wrong.', error);
      window.alert("Unspecified error");
    });
  }

  doAjax().then(console.log).catch(console.log);
}

init();
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App ideas={ideasList} />
  </React.StrictMode>
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
//reportWebVitals();
