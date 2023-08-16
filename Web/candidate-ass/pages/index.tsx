import Link from 'next/link'

export default function WelcomePage() {
  return (
    <div className="container">
      <h1>Welcome to Candidate Assessment</h1>
      <p className="text-gray-800 mb-6">Do you want to view the candidates?</p>
      <Link
        href="/Users"
        className="button bg-blue-500 text-white py-2 px-4 rounded"
      >
        View candidates
      </Link>

      <style jsx>{`
        .container {
          max-width: 800px;
          margin: 0 auto;
          padding: 20px;
        }

        h1 {
          font-size: 36px;
          margin-bottom: 20px;
        }

        .image-container {
          display: flex;
          justify-content: space-between;
          margin-bottom: 40px;
        }

        .image {
          width: calc(33.33% - 10px);
          height: auto;
        }

        p {
          font-size: 18px;
          line-height: 1.5;
          margin-bottom: 40px;
        }

        .button {
          display: inline-block;
          background-color: #0070f3;
          color: #fff;
          padding: 12px 24px;
          border-radius: 4px;
          font-size: 18px;
          text-decoration: none;
        }

        .button:hover {
          background-color: #0062cc;
        }
      `}</style>
    </div>
  )
}
