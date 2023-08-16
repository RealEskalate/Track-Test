import { ReactNode } from 'react'
import Footer from './Footer'
import NavBar from './NavBar'

interface LayoutProp {
  children: ReactNode
}
const Layout = ({ children }: LayoutProp) => {
  return (
    <div className="content">
      <NavBar />
      {children}
      <Footer />
    </div>
  )
}
export default Layout
