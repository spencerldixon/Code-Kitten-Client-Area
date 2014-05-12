class Project < ActiveRecord::Base
	belongs_to :user
	has_many :invoices
	validates :name, presence: true
	validates :name, length: { minimum: 8 }
end
