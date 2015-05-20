class User < ActiveRecord::Base
  has_many :tracks

  validates :name, :email, presence: true
  validates :email, format: { with: /\A[a-zA-Z]+[-_\.]*[a-zA-Z0-9]+@[a-zA-Z]+[-_\.]*[a-zA-Z0-9]+\.[a-zA-Z0-9]{2,}\z/, message: "must be valid email" }
  validates :email, uniqueness: true
end