class User < ApplicationRecord
  has_many :jobs
  has_many :contacts
  has_many :interviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable,
    :confirmable, :lockable, :timeoutable, :trackable

  attribute :time_zone, :string, default: "Eastern Time (US & Canada)"
end
