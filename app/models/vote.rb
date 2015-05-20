class Vote < ActiveRecord::Base
  belongs_to :track
  has_many :user

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true,
                    format: { with: /\A[a-zA-Z]+[-_\.]*[a-zA-Z0-9]+@[a-zA-Z]+[-_\.]*[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,}\z/, message: "must be valid email" }
  validates :password, length: { minimum: 3 }
end