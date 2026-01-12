import { Route } from 'react-router';
import { Routes } from 'react-router';
import Home from './pages/home';

const App = () => {
  return (
    <div className="flex flex-col min-h-screen">
      <Routes>
        <Route index element={<Home />} />
        {/* <Route path="*" element={<NotFound />} /> */}
      </Routes>
    </div>
  );
};

export default App;
