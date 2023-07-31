require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(id: 1, name: 'Timothy Gerard', photo: 'testPicture1.jpg', bio: 'Teacher from Mexico.',
             posts_counter: 0, email: 'timothy@example.com', password: 'password123', role: 'user',
             confirmed_at: Time.now)
  end

  before { subject.save }

  it 'Name must not be blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Post counter must be an interger greater than or equal to 0' do
    subject.posts_counter = 0
    expect(subject).to be_valid
  end
end
