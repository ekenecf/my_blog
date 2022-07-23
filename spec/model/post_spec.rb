require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    user1 = User.new(name: 'Ekene',
                     photo: 'https://as2.ftcdn.net/v2/jpg/02/17/51/67/1000_F
                     _217516770_nHjCK3C82B2ZUC3JB3qQs8W2BGLHxZfa.jpg', bio: 'Microverse_student', postcounter: 0)
    Post.create!(title: 'RSpec is a testing tool for Ruby, created for behavior-driven development (BDD).',
                 text: 'This post is to talk about Tests in ruby', likescounter: 0, commentscounter: 0, user: user1)
  end

  describe 'Post Model validations' do
    it 'should check for invalid if title"s column is empty' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'check for invalid if likescounters is empty' do
      subject.likescounter = nil
      expect(subject).to_not be_valid
    end

    it 'check for invalid if commentscounter is empty' do
      subject.commentscounter = nil
      expect(subject).to_not be_valid
    end

    it 'check for invalid if text is more than 250 characters' do
      subject.title = 't' * 260
      expect(subject).to_not be_valid
    end
  end
end
