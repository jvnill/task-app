class Task < ApplicationRecord
  PRIORITIES = %w[Low Medium High]

  validates :priority, presence: true, inclusion: { in: PRIORITIES, if: proc { |task| task.priority.present? } }
  validates :title, presence: true
  validates :subtitle, presence: true
end
