require 'rails_helper'

describe "user can visit the welcome page" do
  before :each do 
    @station = StationFacade.search_station("1985 Sheridan Blvd. Edgewater CO 80214")
  end
  scenario "and see a dropdown menu" do
    visit '/'
    expect(page).to have_content("Nearest Fuel Station")
    expect(page).to have_content("Search For The Nearest Electric Charging Station")
    expect(page).to have_button("Find Nearest Station")
  end

  it 'select griffin coffee from drop down and I click find nearest station i should be redirected to /search' do 
    visit '/'
    select("Griffin Coffee", :from => :location)
    click_button("Find Nearest Station")
    expect(current_path).to eq("/search")
  end

  it 'I should see the closest electric fuel station to me and name, address, fuel type and hours' do 
    visit '/'
    select("Griffin Coffee", :from => :location)
    click_button("Find Nearest Station")
    expect(current_path).to eq("/search")
    
    expect(page).to have_content(@station[0].name)
    expect(page).to have_content(@station[0].address)
    expect(page).to have_content(@station[0].fuel_type)
    expect(page).to have_content(@station[0].hours)
  end

  it 'I should also see the distance to the nearest station' do 
    visit '/'
    select("Griffin Coffee", :from => :location)
    click_button("Find Nearest Station")
    expect(current_path).to eq("/search")
    
    expect(page).to have_content(@station[0].name)
    expect(page).to have_content(@station[0].address)
    expect(page).to have_content(@station[0].fuel_type)
    expect(page).to have_content(@station[0].hours)
  end
end
