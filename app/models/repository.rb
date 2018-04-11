class Repository
  def async_create_archive(branch)
    Resque.enqueue(Archive, self.id, branch)
  end
end