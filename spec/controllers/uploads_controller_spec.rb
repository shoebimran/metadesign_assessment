require 'rails_helper'

RSpec.describe UploadsController, type: :controller do
  describe 'POST #create' do
    it 'creates users from a sample Excel file' do
      file = fixture_file_upload('sample_excel.xlsx', 'application/vnd.ms-excel')

      post :create, params: { file: file }

    end
  end
end
