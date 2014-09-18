require 'rails_helper'


describe 'add a station' do
  it 'adds a station to the stations table' do
  visit '/stations/new'
  station = Station.create(:name => 'yourmom')
  fill_in 'Name' , :with => "yourmom"
  click_button 'Create Station'
  page.should have_content 'Station saved.'
  end
end
