class Todo < ApplicationRecord
  validates :name, :description, :due_date, :priority, presence: true
  belongs_to :user
end
