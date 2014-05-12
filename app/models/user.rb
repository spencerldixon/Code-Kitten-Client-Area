class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects
  has_many :invoices, through: :projects


  validates :first_name, :last_name, :business_name, presence: true
end
