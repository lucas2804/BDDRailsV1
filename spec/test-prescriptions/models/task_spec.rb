require "rails_helper"

RSpec.describe Task do
  it "can distingish a completed task" do
    task = Task.new
    expect(task).to_not be_completed
    task.mark_completed
    expect(task).to be_completed
  end

  describe "velocity" do
    let(:task) { Task.new(size: 3) }

    it "does not count an incomple" do
      expect(task).not_to be_part_of_velocity
      expect(task.points_toward_velocity).to eq(0)
    end

    it "does not count a long-ago task velocity" do
      task.mark_completed(6.months.ago)
      expect(task).not_to be_part_of_velocity
      expect(task.points_toward_velocity).to eq(0)
    end

    it "counts a recently completed task toward velocity" do
      task.mark_completed(1.days.ago)
      expect(task).to be_part_of_velocity
      expect(task.points_toward_velocity).to eq(3)
    end

  end

end