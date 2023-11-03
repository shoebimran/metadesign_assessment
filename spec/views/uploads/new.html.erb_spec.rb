require 'rails_helper'

RSpec.describe 'uploads/new', type: :view do
  it 'displays the "New Item" header' do
    render
    expect(rendered).to have_selector('h1', text: 'New Item')
  end
end
