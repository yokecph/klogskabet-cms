class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :registerable, :trackable,
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
end
