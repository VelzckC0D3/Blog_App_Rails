## Users information
first_user = User.create(name: 'Tom', photo: 'https://i.postimg.cc/qqFn54L5/Screenshot-2023-07-18-043245.png', bio: 'Teacher from Mexico.', posts_counter: 0)
second_user = User.create(name: 'Lilly', photo: 'https://i.imgur.com/eJzob1I.png', bio: 'Teacher from Poland.', posts_counter: 0)

# User Post
first_post = Post.create(author_id: 1, title: 'My First Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis mi in urna eleifend vehicula sit amet a mauris. Proin eget lacus sit amet velit aliquet dictum.', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author_id: 1, title: 'My Second Post', text: 'Nulla facilisi. Phasellus interdum turpis id est ultrices, ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)
third_post = Post.create(author_id: 1, title: 'My Third Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author_id: 1, title: 'My Fourth Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)

# Post Comments
first_comment = Comment.create(author_id: 2, post_id: 4, text: 'This is my first comment')
second_comment = Comment.create(author_id: 2, post_id: 4, text: 'This is my second comment')
third_comment = Comment.create(author_id: 2, post_id: 4, text: 'This is my third comment')
fourth_comment = Comment.create(author_id: 2, post_id: 4, text: 'This is my fourth comment')
fifth_comment = Comment.create(author_id: 2, post_id: 3, text: 'This is my fifth comment')
sixth_comment = Comment.create(author_id: 2, post_id: 3, text: 'This is my sixth comment')  