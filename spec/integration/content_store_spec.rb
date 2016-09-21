require 'spec_helper'

RSpec.describe "the Random Content Store" do
  it "returns random content for a format that exists" do
    # NB: this will make an actual request to GitHub
    get '/content/detailed_guide'

    expect(last_response).to be_ok
  end

  it "returns 404 if the format does not exist" do
    # NB: this will make an actual request to GitHub
    get '/content/i_am_not_a_format'

    expect(last_response).to be_not_found
  end

  it "returns the index page" do
    get '/'

    expect(last_response).to be_ok
  end
end
