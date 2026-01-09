//# Reemplazar contenido de src/App.tsx
//@'
import { BrowserRouter as Router, Routes, Route } from "react-router-dom"
import Layout from "./components/Layout/Layout"
import LandingPage from "./pages/LandingPage/LandingPage"
import UploadFlow from "./pages/UploadFlow/UploadFlow"

function App() {
  return (
    <Router>
      <Layout>
        <Routes>
          <Route path="/" element={<LandingPage />} />
          <Route path="/upload" element={<UploadFlow />} />
        </Routes>
      </Layout>
    </Router>
  )
}

export default App
//'@ | Set-Content -Path "src\App.tsx" -Encoding UTF8