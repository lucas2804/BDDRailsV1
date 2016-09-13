class Ticket < ActiveRecord::Base
  belongs_to :project
  validates :name, :description, presence: true
  belongs_to :author, class_name: "User"
end
