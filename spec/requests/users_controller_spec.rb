require 'rails_helper'

RSpec.describe "Users", type: :request do
    
    let (:params) {{email:"Tester@tester.com", password:"Qwert!223", name:"Tester" , phoneno:"789456131" , address:"Tirunelveli"}}

    before {
      @user =User.create(params)
    }

    context "Get #index" do
      it "Successfull Response" do
        get api_v1_users_path
        expect(response).to be_successful
      end
    end

    context "Get #show" do
      it "Successfull Response" do
        get api_v1_user_path(@user)
        expect(response).to be_successful
      end
    end

    context "Post #create" do
      it "Successfull Response" do
        post api_v1_users_path(email:"Tester1@tester.com", password:"Qwert!223", name:"Tester" , phoneno:"789456131" , address:"Tirunelveli")
        expect(response).to be_successful
      end
    end

    context "Delete #destroy" do
      it "Successfull Response" do
        delete api_v1_user_path(@user)
        expect(response).to be_successful
      end
    end

    context "Put #update" do
      it "Successfull Response" do
        # put "api_v1_user_path/#{@user.id}" , params: {params}
        # expect(response).to be_successful
      end
    end

end
