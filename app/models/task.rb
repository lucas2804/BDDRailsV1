class Task < ActiveRecord::Base
  belongs_to :project

  def completed?
    completed_at.present?
  end

  def mark_completed(completed_at = nil)
    self.completed_at = (completed_at || Time.current)
  end

  def part_of_velocity?
    return false unless completed?
    completed_at > Project.velocity_length_in_days.days.ago
  end

  def points_toward_velocity
    return size if part_of_velocity?
    return 0
  end
end