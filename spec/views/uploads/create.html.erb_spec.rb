require 'rails_helper'

RSpec.describe 'uploads/create', type: :view do
  it 'displays the "Create a new item" header' do
    render
    expect(rendered).to have_selector('h1', text: 'Create a new item')
  end
end
