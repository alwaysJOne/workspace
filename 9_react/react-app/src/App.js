import logo from './logo.svg';
import './App.css';
import Menu from './components/Menu';
import Comment from './components/Comment';
import CommentList from './classComponent/CommentList';
import UseStateTest from './reactHook/UseStateTest';
import SignUp from './sample/SignUp';
import LandingPage from './sample/LandingPage';
import UseEffectTest from './reactHook/UseEffectTest';
import UseMemoTest from './reactHook/useMemo/useMemoTest';
import UseCallbackTest2 from './reactHook/useCallback/UseCallbackTest2';
import UseRefTest from './reactHook/UseRefTest';
import {BrowserRouter as Router, Routes, Route, Link } from 'react-router-dom';
import Home from './pages/Home';
import FoodMenu from './pages/FoodMenu';

/*
  react-router-dom
  react로 생성된 SPA 내부에서 페이지 이동이 가능하도록 만들어주는 라이브러리

  BrowserRouter(Router)
  history API를 이용해서 history객체를 생성한다.
  라우팅을 진행할 컴포넌트 상위에 Router컴포넌트를 생성하고 감싸주어야한다.
*/


function App() {
  return (
    <Router>
      <div className="App">
        <nav>
            <ul>
              <li>
                <Link to="/">Home</Link>
              </li>
              <li>
                <Link to="/food">Food List</Link>
              </li>
            </ul>
        </nav>
       <Routes>
          <Route path='/' element={<Home />}/>
          <Route path='/food' element={<FoodMenu />}/>
       </Routes>
      </div>
    </Router>
  );
}

export default App;
