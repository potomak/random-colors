require 'rails_helper'

RSpec.describe 'welcome/index.html.erb', :type => :view do
  it 'renders the title' do
    render
    expect(rendered).to include('Random colors')
  end

  it 'renders the start button' do
    render
    expect(rendered).to include('Start')
  end
end
