Given /the following local resources/ do |local_resources_table|
  local_resources_table.hashes.each do |resource|
    LocalResource.create resource
  end
end

Given /the following search items/ do |search_items_table|
  search_items_table.hashes.each do |item|
    SearchItem.create item
  end
end

When("I select {string} from the category drop-down menu") do |category|
  select(category, from: "category")
end
