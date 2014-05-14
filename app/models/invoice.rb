class Invoice < ActiveRecord::Base
	belongs_to :project

	validates :note, presence: true
	validates :amount, 	presence: true, 
						numericality: { greater_than: 10 },
						numericality: { less_than: 1000 }
end
