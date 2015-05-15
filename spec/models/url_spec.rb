require 'rails_helper'

RSpec.describe Url, :type => :model do
  RANDOM_GENERATOR = [*'0'..'9', *'a'..'z', *'A'..'Z']
  .shuffle.join

  before :each do 
    @url = Url.create(
      :original_url => "https://github.com/amshane",
      :times_visited => 0
    )
  end

  it "is valid with a url" do 
    expect(@url).to be_valid
  end

  it "validates the url is of form http:// or https://" do
      expect(@url.original_url).to include("http")
      expect(@url.original_url).to include("https")
      expect(@url.original_url).not_to be_empty
    end
  end

  it "starts with amount of times_visited 0" do 
    expect(@url.times_visited).to eq(0)
  end

  it "has its own character set from a-z, A-Z, 1-9" do 
    expect(RANDOM_GENERATOR).to include("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ123456789")
  end

  describe "#create_short_url" do
    it "encodes its id to the base value of the generated set" do
      @url.update(:custom_url => @url.create_short_url)
      expect(@url.create_short_url).to eq(@url.create_short_url) 
    end
  end

  describe "#show_custom_url" do
    it "should have the shortened url path" do
      @url.update(:custom_url => @url.encode)
      expect(@url.show_custom_url).to include("/urls/#{@url.custom_url}")
    end
  end

end