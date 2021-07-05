require 'rails_helper'

RSpec.describe "Api::V1::UsersController", type: :request do
    
    let (:params) {{email:"Tester@tester.com", password:"Qwert!223", name:"Tester" , phoneno:"789456131" , address:"Tirunelveli"}}
    let (:params1) {{email:"Tester1@tester.com", password:"Qwert!223", name:"Tester" , phoneno:"789456131" , address:"Tirunelveli"}}
    let (:update_params) {{email:"Tester@tester.com", password:"Qwert!223", name:"Rspec_Tester" , phoneno:"789456131" , address:"Tirunelveli"}}

    before {
      @user =User.create(params)
      allow_any_instance_of(Api::V1::UsersController).to receive(:doorkeeper_authorize!) {true}
    }

    context "Get #index" do
      it "Successfull Response" do
        get api_v1_users_path
        expect(response).to be_successful
      end

      it "Check Header Response" do
        get api_v1_users_path
        expect(response.header['Content-Type']).to include('application/json')
      end

      it "Correct JSON Response" do
        get api_v1_users_path
        expect(valid_json?(response)).to eq(true)
      end

    end

    context "Get #show" do
      it "Successfull Response" do
        get api_v1_user_path(@user)
        expect(response).to be_successful
      end

      it "Check Header Response" do
        get api_v1_user_path(@user)
        expect(response.header['Content-Type']).to include('application/json')
      end

      it "Correct JSON Response" do
        get api_v1_user_path(@user)
        expect(valid_json?(response)).to eq(true)
      end

    end

    context "Post #create" do
      it "Successfull Response" do
        post api_v1_users_path(params1)
        expect(response).to be_successful
      end

      it "Check Header Response" do
        post api_v1_users_path(params1)
        expect(response.header['Content-Type']).to include('application/json')
      end

      it "Correct JSON Response" do
        post api_v1_users_path(params1)
        expect(valid_json?(response)).to eq(true)
      end

    end

    context "Delete #destroy" do
      it "Successfull Response" do
        delete api_v1_user_path(@user)
        expect(response).to be_successful
      end

      it "Check Header Response" do
        delete api_v1_user_path(@user)
        expect(response.header['Content-Type']).to include('application/json')
      end

      it "Correct JSON Response" do
        delete api_v1_user_path(@user)
        expect(valid_json?(response)).to eq(true)
      end

    end

    context "Put #update" do
      it "Successfull Response" do
        put api_v1_users_path+"/"+@user.id.to_s , params: {user:update_params}
        expect(response).to be_successful
      end

      it "Check Header Response" do
        put api_v1_users_path+"/"+@user.id.to_s , params: {user:update_params}
        expect(response.header['Content-Type']).to include('application/json')
      end

      it "Correct JSON Response" do
        put api_v1_users_path+"/"+@user.id.to_s , params: {user:update_params}
        expect(valid_json?(response)).to eq(true)
      end

    end

    private 

    def valid_json?(response)
      if JSON.parse(response.body.to_s)
        return true
      end
      return false
    end

    def valid_header?(response)
      response.header['Content-Type'].should include 'application/json'
    end

end
