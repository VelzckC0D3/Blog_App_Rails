## Users information
ethan = User.create(name: 'Ethan Johnson', photo: 'https://i.postimg.cc/gctvJHWH/Screenshot-2023-07-18-151935.png', 
    bio: 'Dedicated Mexican educator with a passion for fostering inclusive learning environments. Utilizes interactive teaching methods to 
    inspire students, promote cultural appreciation, and empower young minds for a brighter future in Mexico.', posts_counter: 0)
second_user = User.create(name: 'Olivia Martinez', photo: 'https://i.postimg.cc/GttGKHkD/Screenshot-2023-07-18-152128.png', 
    bio: 'Dedicated Polish educator with a passion for fostering curiosity and critical thinking in students. Committed to creating a nurturing 
    learning environment that empowers and inspires, while instilling a lifelong love for knowledge and personal growth.', posts_counter: 0)
third_user = User.create(name: 'Benjamin Parker', photo: 'https://i.postimg.cc/LXct7Y5x/Screenshot-2023-07-27-032800.png', 
    bio: 'Enthusiastic American educator committed to cultivating a dynamic learning experience. Inspiring students to reach their full 
    potential by fostering a love for learning, encouraging creativity, and embracing diversity in the classroom.', posts_counter: 0)
fourth_user = User.create(name: 'Isabella Thompson', photo: 'https://i.postimg.cc/7LQM3Qk8/Screenshot-2023-07-27-032914.png', 
    bio: 'Experienced American teacher devoted to empowering students intellectual and emotional growth. Emphasizing personalized learning, instilling a 
    sense of curiosity, and fostering an inclusive environment that celebrates diversity and nurtures a lifelong love for learning.', posts_counter: 0)

# User 1 Post
first_post = Post.create(author_id: 1, title: 'My First Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis mi in urna eleifend vehicula sit amet a mauris. Proin eget lacus sit amet velit aliquet dictum.', comments_counter: 0, likes_counter: 0)
second_post = Post.create(author_id: 1, title: 'My Second Post', text: 'Nulla facilisi. Phasellus interdum turpis id est ultrices, ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)
third_post = Post.create(author_id: 1, title: 'My Third Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(author_id: 1, title: 'My Fourth Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0) 
Post.create(author_id: 1, title: 'My Fifth Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 1, title: 'My Sixth Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 1, title: 'My Seventh Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 1, title: 'My Eigth Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)

# User 2 Post
Post.create(author_id: 2, title: 'My First Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis mi in urna eleifend vehicula sit amet a mauris. Proin eget lacus sit amet velit aliquet dictum.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 2, title: 'My Second Post', text: 'Nulla facilisi. Phasellus interdum turpis id est ultrices, ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 2, title: 'My Third Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 2, title: 'My Fourth Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 2, title: 'My Fifth Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)

# User 3 Post
Post.create(author_id: 3, title: 'My First Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis mi in urna eleifend vehicula sit amet a mauris. Proin eget lacus sit amet velit aliquet dictum.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 3, title: 'My Second Post', text: 'Nulla facilisi. Phasellus interdum turpis id est ultrices, ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 3, title: 'My Third Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 3, title: 'My Fourth Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 3, title: 'My Fifth Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 3, title: 'My Sixth Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 3, title: 'My Seventh Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)

# User 4 Post
Post.create(author_id: 4, title: 'My First Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus quis mi in urna eleifend vehicula sit amet a mauris. Proin eget lacus sit amet velit aliquet dictum.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 4, title: 'My Second Post', text: 'Nulla facilisi. Phasellus interdum turpis id est ultrices, ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 4, title: 'My Third Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 4, title: 'My Fourth Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 4, title: 'My Fifth Post', text: 'Sed sed venenatis nibh. Aenean elementum dolor a purus vehicula, quis faucibus ipsum scelerisque. Cras aliquam facilisis odio, at dignissim lorem varius vel.', comments_counter: 0, likes_counter: 0)
Post.create(author_id: 4, title: 'My Sixth Post', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.ac tincidunt est aliquam. Suspendisse potenti. Fusce eget varius odio, a aliquam odio.', comments_counter: 0, likes_counter: 0)

# Post Comments User 1
Comment.create(author_id: 1, post_id: 8, text: 'This is my first comment')
Comment.create(author_id: 1, post_id: 13, text: 'This is my second comment')
Comment.create(author_id: 1, post_id: 20, text: 'This is my third comment')
Comment.create(author_id: 1, post_id: 26, text: 'This is my fourth comment')
Comment.create(author_id: 1, post_id: 8, text: 'This is my fifth comment')
Comment.create(author_id: 1, post_id: 13, text: 'This is my sixth comment')
Comment.create(author_id: 1, post_id: 20, text: 'This is my seventh comment')
Comment.create(author_id: 1, post_id: 26, text: 'This is my eigth comment')

# Post Comments User 2
Comment.create(author_id: 2, post_id: 8, text: 'This is my first comment')
Comment.create(author_id: 2, post_id: 13, text: 'This is my second comment')
Comment.create(author_id: 2, post_id: 20, text: 'This is my third comment')
Comment.create(author_id: 2, post_id: 26, text: 'This is my fourth comment')
Comment.create(author_id: 2, post_id: 8, text: 'This is my fifth comment')
Comment.create(author_id: 2, post_id: 13, text: 'This is my sixth comment')
Comment.create(author_id: 2, post_id: 20, text: 'This is my seventh comment')
Comment.create(author_id: 2, post_id: 26, text: 'This is my eigth comment')

# Post Comments User 3
Comment.create(author_id: 3, post_id: 8, text: 'This is my first comment')
Comment.create(author_id: 3, post_id: 13, text: 'This is my second comment')
Comment.create(author_id: 3, post_id: 20, text: 'This is my third comment')
Comment.create(author_id: 3, post_id: 26, text: 'This is my fourth comment')
Comment.create(author_id: 3, post_id: 8, text: 'This is my fifth comment')
Comment.create(author_id: 3, post_id: 13, text: 'This is my sixth comment')
Comment.create(author_id: 3, post_id: 20, text: 'This is my seventh comment')
Comment.create(author_id: 3, post_id: 26, text: 'This is my eigth comment')

# Post Comments User 4
Comment.create(author_id: 4, post_id: 8, text: 'This is my first comment')
Comment.create(author_id: 4, post_id: 13, text: 'This is my second comment')
Comment.create(author_id: 4, post_id: 20, text: 'This is my third comment')
Comment.create(author_id: 4, post_id: 26, text: 'This is my fourth comment')
Comment.create(author_id: 4, post_id: 8, text: 'This is my fifth comment')
Comment.create(author_id: 4, post_id: 13, text: 'This is my sixth comment')
Comment.create(author_id: 4, post_id: 20, text: 'This is my seventh comment')
Comment.create(author_id: 4, post_id: 26, text: 'This is my eigth comment')