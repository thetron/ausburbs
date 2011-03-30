require 'spec_helper'

describe Ausburbs do
  before :each do

  end

  it "should return a list of states" do
    Ausburbs.states.should be_a(Hash)
    Ausburbs.states.has_key?(:act).should be_true
    Ausburbs.states.has_key?(:nsw).should be_true
    Ausburbs.states.has_key?(:nt).should be_true
    Ausburbs.states.has_key?(:qld).should be_true
    Ausburbs.states.has_key?(:sa).should be_true
    Ausburbs.states.has_key?(:tas).should be_true
    Ausburbs.states.has_key?(:vic).should be_true
    Ausburbs.states.has_key?(:wa).should be_true
  end

  it "should return an list of suburbs for a given state" do
    Ausburbs.suburbs("NSW").should be_an(Array)
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

  it "should have an abbreviation" do
    @state.respond_to?(:abbreviation).should be_true
    @state.abbreviation.should be_a(String)
    @state.respond_to?(:abbr).should be_true
    @state.abbr.should be_a(String)
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
    @suburb.respond_to?(:suburb).should be_true
    @suburb.suburb.should be_a(String)
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
