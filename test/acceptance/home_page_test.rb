require_relative 'acceptance_helper'

describe "Home page" do

  include AcceptanceHelper

  it "return 200" do
    visit "/"
    assert_equal 200, page.status_code
  end

  it 'visits_all_other_pages_to_do_regression_test' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    assert page.find('div#results').text.include?('Energy Demand')
  end

  it 'visits_all_energy' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    click_on 'All Energy'
    assert page.find('div#results').text.include?('Energy Demand')
  end

  it 'visits_electricity' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    click_on 'Electricity'
    assert page.find('div#results').text.include?('Electricity demand')
  end

  it 'visits_energy_security' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    click_on 'Energy Security'
    assert page.find('div#results').text.include?('Percentage Import Dependence')
  end

  it 'visits_energy_emissions' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    click_on 'Energy Emissions'
    assert page.find('div#results').text.include?('Total Emissions')
  end

  it 'visits_energy_flows' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    click_on 'Energy Flows'
    assert page.find('div#results').text.include?('Flows in the Indian Energy System')
  end

  it 'visits_land_requirements' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    click_on 'Land Requirement'
    assert page.find('div#results').text.include?('Land Footprint')
  end

  it 'visits_grid_balancing' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    click_on 'Grid Balancing'
    assert page.find('div#results').text.include?('Grid dispatch pattern')
  end

  it 'visits_energy_cost' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    click_on 'Energy Costs'
    assert page.find('div#results').text.include?('energy system costs')
  end

  it 'visits_my_story' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    click_on 'My Story'
    assert page.find('div#results').text.include?('The chosen energy pathway')
  end

  it 'visits_assumptions' do
    visit "/"
    page.find('body .popover .popover-navigation').click_button('Enter Calculator')
    click_on 'Assumptions'
    assert page.find('div#results').text.include?('Assumptions')
  end

end