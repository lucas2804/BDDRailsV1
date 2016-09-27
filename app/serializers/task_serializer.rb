class TaskSerializer < ActiveModel::Serializer
  attributes :id, :project, :title, :size, :completed_at
end
