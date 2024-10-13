import logo from './logo.svg';
import './App.css';
import Ideas from './components/IdeaRows.js';

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

function App() {
  const ideas = [
    { id: 1, title: "Test title 1", author: "Test author 1", likes: 1 },
    { id: 2, title: "Test title 2", author: "Test author 2", likes: 10 },
    { id: 3, title: "Test title 3", author: "Test author 3", likes: 100 },
  ];

  return (
    <>
      <div className="App">
        <h1>Hello World!</h1>
      </div>
      <div>
        <Ideas ideas={ideas} />
      </div>
    </>
  );
}

export { ReactBase, App };

