require 'rails_helper'

RSpec.describe 'Uploads', type: :request do
  it 'returns a successful response' do
    get uploads_path # Use the route helper for the index action
    expect(response).to have_http_status(302)
  end
end
