require 'spec_helper'

describe Ausburbs do
  before :each do

  end

  it "should return a list of states, in alphabetical order" do
    Ausburbs.states.should be_a(Array)
    last_state = nil
    Ausburbs.states.each do |state|
      state.should be_a(Ausburbs::State)
      (state.name > last_state.name).should be_true if last_state
      last_state = state
    end
  end

  it "should return an list of suburbs for a given state, in postcode order" do
    Ausburbs.states.each do |state|
      state.suburbs.should be_a(Array)
      last_suburb = nil
      state.suburbs.each do |suburb|
        suburb.should be_a(Ausburbs::Suburb)
        (suburb.postcode >= last_suburb.postcode).should be_true if last_suburb
        last_suburb = suburb
      end
    end
  end

  it "should return the list of state names, in alphabetical order" do
    Ausburbs.state_names.should be_a(Array)
    last_state_name = nil
    Ausburbs.state_names.each do |state_name|
      (state_name.should >= last_state_name).should be_true if last_state_name
      last_state_name = state_name
    end
  end

  it "should return a state for a given state name" do
    Ausburbs.state_names.each do |state_name|
      Ausburbs.state(state_name).should be_a(Ausburbs::State)
      Ausburbs.state(state_name).name.should == state_name
    end
  end
end

describe Ausburbs::State do
  before :each do
    @state = Ausburbs.states.first
  end

  it "should have a name" do
    @state.respond_to?(:name).should be_true
    @state.name.should be_a(String)
  end

  it "should return a list of suburbs" do
    @state.suburbs.should be_an(Array)
  end
end

describe Ausburbs::Suburb do
  before :each do
    @suburb = Ausburbs.states.first.suburbs.first
  end

  it "should have a name" do
    @suburb.respond_to?(:name).should be_true
    @suburb.name.should be_a(String)
  end

  it "should have a postcode" do
    @suburb.respond_to?(:postcode).should be_true
    @suburb.postcode.should be_a(String)
  end

  it "should have a latitude"do
    @suburb.respond_to?(:latitude).should be_true
    @suburb.latitude.should be_a(Float)
  end

  it "should have a longitude" do
    @suburb.respond_to?(:longitude).should be_true
    @suburb.longitude.should be_a(Float)
  end
end
