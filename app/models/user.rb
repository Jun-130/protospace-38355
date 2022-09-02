class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :prototypes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  with_options presence: true do
    validates :name
    validates :profile
    validates :occupation
    validates :position
  end
end