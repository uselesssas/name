# README

Prepare config-files:
`cp .env.example .env`

### Practical work 5.6.1
2.1) Post.all
2.2) Post.order(created_at: :desc)
2.3) Post.order(:created_at).limit(5)
2.4) Post.find(1)
2.5) Post.create(description: FFaker::Book.description)
2.6) Post.first.update(description: 'description')
2.7) Post.where('created_at <= ?', 5.minutes.ago).destroy_all

5)
2.times { User.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name) }
Post.create(user_id: 1, description: FFaker::Book.description)
Post.create(user_id: 2, description: FFaker::Book.description)
6)
2.times { User.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name) }
7)
User.includes(:posts).references(:posts).where('posts.id IS NOT NULL')
8)
User.includes(:posts).references(:posts).where('posts.id IS NULL')
9)
User.includes(:posts)
User.preload(:posts)
User.eager_load(:posts)
