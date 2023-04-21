Given /the following local resources/ do |local_resources_table|
  local_resources_table.hashes.each do |resource|
    LocalResource.create resource
  end
end