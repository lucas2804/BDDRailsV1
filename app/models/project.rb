class Project < ActiveRecord::Base
  has_many :tasks
  validates :name, presence: true
  has_many :tickets, dependent: :destroy #delete_all just use SQL DELETE, not check validate
  has_many :roles, dependent: :delete_all


  # Test-Prescriptions-Rspec-Ebook
  def done?
    incomplete_tasks.empty?
  end

  def remaining_size
    incomplete_tasks.sum(&:size)
  end

  def total_size
    tasks.to_a.sum(&:size)
  end

  # calculate
  def completed_velocity
    tasks.to_a.sum(&:points_toward_velocity)
  end


  def current_rate
    completed_velocity * 1.0 / Project.velocity_length_in_days
  end

  def projected_days_remaining
    remaining_size / current_rate
  end

  def on_schedule?
    return false if projected_days_remaining.nan?
    (Date.today + projected_days_remaining) <= due_date
  end

  private
  def incomplete_tasks
    tasks.to_a.reject(&:completed?)
  end

  def self.velocity_length_in_days
    21
  end

end
