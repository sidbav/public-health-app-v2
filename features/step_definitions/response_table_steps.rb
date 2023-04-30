Given("a survey with id {int} exists") do |id|
    Survey.create(id: id, survey_name: "Test Survey", survey_category: "Test Category", languages: ["en"], created_at: Time.now, updated_at: Time.now)
  end
  
  
  Given("a user with id {int} exists") do |user_id|
    User.create!(email: "testuser@example.com", password: "password", first_name: "Test", last_name: "User", address_line_1: "123 Main St", city: "Anytown", state: "NY", zip: "12345", phone_number: "555-555-5555", date_of_birth: Date.today - 20.years)
  end

  When("I delete the response with id {int}") do |response_id|
    Response.destroy(response_id)
  end
  
  
  When("I create a response with the following attributes:") do |table|
    response_attrs = table.rows_hash
    Response.create!(response_attrs)
  end
  
  Then("the response should be saved in the database") do
    expect(Response.count).to eq(1)
  end
  
  Then("the response should have the following attributes:") do |table|
    response_attrs = table.rows_hash
    response = Response.first
  
    response_attrs.each do |attr, value|
      expect(response[attr]).to eq(value)
    end
  end
  
  Given("a response with id {int} exists") do |response_id|
    Response.create!(id: response_id, survey_id: 1, user_id: 1, question_number: "1", response_score: 3, response_option_number: 1)
  end
  
  When("I update the response with the following attributes:") do |table|
    response_attrs = table.rows_hash
    response = Response.first
    response.update(response_attrs)
  end
  
  Then("the response should be updated in the database") do
    response = Response.first
    expect(response.updated_at).to be_within(2.seconds).of(Time.now)
  end
  
  Then("the response should have the following attributes:") do |table|
    response_attrs = table.rows_hash
    response = Response.first
  
    response_attrs.each do |attr, value|
      expect(response[attr]).to eq(value)
    end
  end
  
  When("I delete the response") do
    Response.first.destroy
  end
  
  Then("the response should not exist in the database") do
    expect(Response.count).to eq(0)
  end
  