class UploadsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def create
    excel_file = params[:file]
    if excel_file.present?
      result = process_excel_file(excel_file)
      flash[:notice] = "Total users: #{result[:total_rows]}, Successful: #{result[:successful]}, Failed: #{result[:failed]}"
      flash[:failure_reasons] = result[:errors]

    else
      flash[:alert] = "Please select an Excel file."
    end
    redirect_to new_upload_path
  end


  private

  def process_excel_file(file)
    result = { total_rows: 0, successful: 0, failed: 0, errors: [] }
    spreadsheet = Roo::Excelx.new(file.path)

    header_mapping = { 'FIRST_NAME' => 'first_name', 'LAST_NAME' => 'last_name', 'EMAIL_ID' => 'email' }

    # Create a hash with header names as keys
    headers = spreadsheet.row(1).map { |header| header&.to_s&.strip }

    spreadsheet.each_row_streaming(header_search: headers) do |row|
      result[:total_rows] += 1
      attributes = {}

      headers.each_with_index do |header, i|
        source_header = header_mapping[header]
        cell_value = row[i].to_s.strip
        attributes[source_header.to_sym] = cell_value
      end

      # Generate a random password and password confirmation
      generated_password = Devise.friendly_token.first(8)
      attributes[:password] = generated_password
      attributes[:password_confirmation] = generated_password

      user = User.new(attributes)

      if user.save
        result[:successful] += 1
      else
        result[:failed] += 1
        result[:errors] << "Row #{result[:total_rows]}: #{user.errors.full_messages.to_sentence}"
      end
    end

    result
  end
end
