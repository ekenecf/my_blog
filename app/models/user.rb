class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true
  # postscounter must be an integer greater than or equal to zero.
  validates :postcounter, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :posts, foreign_key: 'authorId', dependent: :destroy
  has_many :likes, foreign_key: 'authorId', dependent: :destroy
  has_many :comments, foreign_key: 'authorId', dependent: :destroy

  def most_recent_posts
    posts.order('created_at DESC').limit(3)
  end

  def admin?
    :role == 'admin'
  end
end
