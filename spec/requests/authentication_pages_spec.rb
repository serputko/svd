require 'spec_helper'

describe "AuthenticationPages" do
  describe "GET /authentication_pages" do
    it "Return 200 code" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get authentication_pages_index_path
      response.status.should be(200)
    end
  end
end
