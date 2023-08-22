import Link from 'next/link'

const NavBar = () => {
  return (
    <nav className="bg-gray-200">
      <div className="container mx-auto flex flex-wrap items-center justify-between py-6">
        <div className="logo">
          <h1 className="text-xl font-semibold">Assessment Website</h1>
        </div>
        <div className="links">
          <Link href="/" className="text-gray-800 mr-4">
            Home
          </Link>
          <Link href="/contact" className="text-gray-800">
            Contact
          </Link>
        </div>
      </div>
    </nav>
  )
}
export default NavBar
