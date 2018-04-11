class Archive
  @queue = :file_serve

  def self.perform(repo_id, branch = 'master')
    puts "Miracleeeeeeee"
    repo = Repository.find(repo_id)
    repo.create_archive(branch)
  end
end