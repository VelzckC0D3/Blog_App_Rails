require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John Doe', posts_counter: 0) }

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
