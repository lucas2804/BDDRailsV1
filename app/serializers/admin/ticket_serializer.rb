class Admin::TicketSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  has_one :project
end
