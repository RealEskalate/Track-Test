import Image from 'next/image'

const Detail = () => {
  const blog = {
    id: '1',
    title: 'Abebe',
    author: 'Abebe_k',
    date: '2022-01-01',
    blogImage: '/img/blog/admin.jpg',
    content:
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vitae sapien sed augue volutpat malesuada. In eget nulla non massa finibus lacinia at id tellus. Aliquam vel consectetur tellus. Sed vitae justo nec tellus posuere bibendum. Morbi auctor ultricies arcu, vel malesuada lorem maximus ut. Praesent efficitur vestibulum orci, id pulvinar mi ullamcorper in. Duis dapibus, turpis sit amet consequat malesuada, nisi nisl lacinia eros, a sagittis purus sapien ut magna. Fusce elementum ex sit amet aliquam fringilla. Suspendisse eget sapien euismod, malesuada libero eu, commodo velit. Vestibulum condimentum semper felis, vel varius nisl commodo quis.',
  }

  return (
    <div className="bg-white text-black">
      <div className="text-3xl pt-20 flex items-center justify-center">
        <h1 className="font-french-cannon">{blog.title}</h1>
      </div>

      <div className="flex items-center justify-center text-xs font-extralight mt-2">
        <div className="flex items-center gap-3 font-montserrat">
          <div>|</div>
        </div>
      </div>

      <div className="flex items-center justify-center h-480 mt-10">
        <Image src={blog.blogImage} alt={blog.title} width={960} height={480} />
      </div>

      <div className="flex items-center justify-center mt-6">{blog.author}</div>

      <div className="flex items-center justify-center mt-8">
        {blog.content}
      </div>
    </div>
  )
}

export default Detail
