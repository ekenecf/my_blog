require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'I love programming') }
  before { subject.save }

  it 'No comment raise error' do
    expect { subject.commentcounter }.to raise_error(NoMethodError)
  end
end
