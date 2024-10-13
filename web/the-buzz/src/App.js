import { useState, createContext } from 'react';
import logo from './logo.svg';
import './App.css';
import Ideas from './components/IdeaRows.js';
import CreateIdea from './components/CreateIdea.js';

function ReactBase() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to reload.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

//const UserContext = createContext();

function App() {


  const ideasState = useState([
    { id: 1, title: "Test title 1", author: "Test author 1", message: "test message 1", likes: 1 },
    { id: 2, title: "Test title 2", author: "Test author 2", message: "test message 2", likes: 10 },
    { id: 3, title: "Test title 3", author: "Test author 3", message: "test message 3", likes: 100 },
  ]);

  const [ideas, setIdeas] = ideasState;

  // handleCallback = (newIdea) => {
  //   setIdeas(previousIdeas => {
  //     return [...previousIdeas, newIdea];
  //   })
  // }

  // handleCallback({ id: 4, title: "Test title 4", author: "Test author 4", message: "test message 4", likes: 250 });


  return (
    <>
      <div className="App">
        <h1>The Buzz</h1>
      </div>
      {/* <UserContext.Provider value={{ ideas, setIdeas }}> */}
      <div>
        <CreateIdea state={ideasState} />
      </div>
      {/* </UserContext.Provider> */}
      <div className="ideaRows">
        <Ideas ideas={ideas} />
      </div>
    </>
  );
}

export { ReactBase, App };

