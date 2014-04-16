class Task < ActiveRecord::Base
	belongs_to :project

	scope :completed, -> { where(:completed => true) }
	scope :incomplete, -> { where(:completed => false) }

	scope :notDue, -> { where(:due_date => nil) }
	scope :due, -> { where.not(:due_date => nil) }

	validates :name, presence: true

	def late? () due_date < DateTime.now end

end
