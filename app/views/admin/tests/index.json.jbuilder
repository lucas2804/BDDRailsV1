json.array!(@admin_tests) do |admin_test|
  json.extract! admin_test, :id
  json.url admin_test_url(admin_test, format: :json)
end
