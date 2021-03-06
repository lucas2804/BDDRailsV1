class Question < ActiveRecord::Base
  belongs_to :test
  has_many :answers, :dependent => :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  validates_associated :answers
  validates :name, presence: true

end
