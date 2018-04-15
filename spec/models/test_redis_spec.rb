require 'rails_helper'
RSpec.describe Project do
  describe 'init' do
    it 'should run redis normaly' do
      redis = Redis.new(port: 6379, db: 15)
      str = redis.set("mykey", "hello world")
      expect(str).to eq('OK')
    end
  end
end
