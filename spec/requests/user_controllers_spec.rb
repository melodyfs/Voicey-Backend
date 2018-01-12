require 'rails_helper'

RSpec.describe "UserControllers", type: :request do
  describe "GET /user_controllers" do
    context "unauthorized" do
        before {
            valid_params = {name: "Matt", email: "matt@test.com", password: "test"}
            post "/users", params: valid_params
        }
        it "create and send success of creating a user with valid params" do
            expect(response).to be_success
        end
    end

    context "invalid params" do
        before {
            invalid_params = {email: "matt@test.com", password: "test"}
            post "/users", params: invalid_params
        }

        it "should fail. Error code 404" do
            expect(response).to_not be_success 
        end
    end
  end
end
