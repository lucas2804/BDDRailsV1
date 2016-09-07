class TestResult < ActiveRecord::Base
  belongs_to :question, required: true
  belongs_to :test
  belongs_to :user, required: true
  belongs_to :answer

  validates :question_id, :test_id, :user_id, :answer_id, presence: true
  validates_uniqueness_of :question_id, scope: :user_id
end
