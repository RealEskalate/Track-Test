import { Blog } from '@/types/case'
import Image from 'next/image'
import Link from 'next/link'

interface UserCard {
  blog: Blog
}

export const UserDetail: React.FC<UserCard> = ({ blog }) => {
  return (
    <Link href={`Users/${blog.id}`}>
      <div className="mb-6">
        <hr className="mx-4 h-2" />

        <div
          className="grid grid-cols-2"
          style={{ gridTemplateColumns: `70% 30%` }}
        >
          <div className="flex mt-6">
            <div className="flex flex-col">
              <div className="mt-4 font-semibold text-xl me-40">
                {blog.title}
              </div>
              <div className="mt-6 me-28 text-sm font-extralight">
                {blog.content}
              </div>
            </div>
          </div>
          <div className="flex items-center justify-center">
            <Image
              className="rounded-lg"
              src={blog.blogImage}
              alt={blog.title}
              width={300}
              height={180}
            />
          </div>
        </div>
      </div>
    </Link>
  )
}
