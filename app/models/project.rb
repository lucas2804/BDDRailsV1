class Project < ActiveRecord::Base
  validates :name, presence: true
  has_many :tickets, dependent: :destroy #delete_all just use SQL DELETE, not check validate
  has_many :roles, dependent: :delete_all
end
