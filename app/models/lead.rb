class Lead < ApplicationRecord
  def self.check_connection_videoask
    response = HTTP.request(
      'GET',
      'https://api.videoask.com/organizations',
      headers: {
        "Authorization": "Bearer #{ENV['VIDEOASK_API_KEY']}",
    })
  end

  def self.get_forms
    response = HTTP.request(
      'GET',
      'https://api.videoask.com/forms?limit=20&offset=0',
      headers: {
        "Authorization": "Bearer #{ENV['VIDEOASK_API_KEY']}",
        "organization-id": "8201962f-3f1b-4499-be50-9be3e770eeae"
      })
  end

  def self.get_question(question_id:)
    response = HTTP.request(
       'GET',
       "https://api.videoask.com/questions/#{question_id}",
       headers: {
        "Authorization": "Bearer #{ENV['VIDEOASK_API_KEY']}",
        "organization-id": "8201962f-3f1b-4499-be50-9be3e770eeae"
       }
      )
    response = JSON.parse(response.body.to_s)
  end

  def self.get_answers(contact_id:)
    response = HTTP.request(
      'GET',
      "https://api.videoask.com/forms/28fe093e-97c6-4933-b939-6c63c1317d84/contacts/#{contact_id}?include_answers=true&include_messages=true",
      headers: {
        "Authorization": "Bearer #{ENV['VIDEOASK_API_KEY']}",
        "organization-id": "8201962f-3f1b-4499-be50-9be3e770eeae"
      })
  end

  def self.get_question_insights(question_id:)
    response = HTTP.request(
      'GET',
      "https://api.videoask.com/questions/#{question_id}/insights",
      headers: {
        "Authorization": "Bearer #{ENV['VIDEOASK_API_KEY']}",
        "organization-id": "8201962f-3f1b-4499-be50-9be3e770eeae"
      })
  end

  def self.get_insurance_count
    response = HTTP.request(
      'GET',
      "https://api.videoask.com/questions/14ffe634-d7cf-446d-a84e-39e321996042/insights",
      headers: {
        "Authorization": "Bearer #{ENV['VIDEOASK_API_KEY']}",
        "organization-id": "8201962f-3f1b-4499-be50-9be3e770eeae"
      })
      JSON.parse(response.body.to_s)
  end

  def self.get_all_convo
    response = HTTP.request(
      'GET',
      'https://api.videoask.com/forms/28fe093e-97c6-4933-b939-6c63c1317d84/conversations',
      headers: {
        "Authorization": "Bearer #{ENV['VIDEOASK_API_KEY']}",
        "organization-id": "8201962f-3f1b-4499-be50-9be3e770eeae"
      })
    JSON.parse(response.body.to_s)
  end
end