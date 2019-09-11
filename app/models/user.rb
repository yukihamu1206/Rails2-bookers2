class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :books, dependent: :destroy
         attachment :profile_image

validates :introduction, length: {maximum: 50}
validates :name, length: {maximum: 20}
validates :name, length: {minimum: 2}
validates :name, presence: true

end
# validates :introduction, length: { maximum: 50}, on: :create
# validates :name, length: {maximum: 20}, on: :create
# validates :name, length: {minimum: 2}, on: :create
# validates :name, presence: true, on: :create
