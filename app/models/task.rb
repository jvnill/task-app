class Task < ApplicationRecord
  PRIORITIES = %w[Low Medium High]

  validates :priority, presence: true, inclusion: { in: PRIORITIES, if: proc { |task| task.priority.present? } }
  validates :title, presence: true
  validates :subtitle, presence: true

  scope :order_recently, -> { order(id: :desc) }
  scope :unfinished, -> { where.not(finished: true) }

  before_create :set_finished_to_false

  private

  def set_finished_to_false
    self.finished = false
  end
end
