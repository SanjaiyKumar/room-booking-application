module Api
    module V1
      class UsersController < ApplicationController
        respond_to :json
        protect_from_forgery with: :null_session
        before_action :find_user , only: [:show,:update,:destroy,:userlogs]
  
        def index
          @users = User.all
          render json:@users
        end

        def show 
          if @user
            render json: {user: @user , message: "Successfull"} , status:200
          else
            render json: {error: "No user Found"} , status:400
          end
        end

        def create
          @user = User.new
          @user.email = params[:email]
          @user.password = params[:password]
          @user.name = params[:name]
          @user.phoneno = params[:phoneno]
          @user.address = params[:address]
          if @user.save
            render json:@user
          else
            render error: {error: "Unable to insert"} , status:400
          end
        end

        def update
          if @user
            @user.update(user_params)
            render json: {user:@user , message: "Successfully updated"} , status:200
          else
            render json: {message: "Unable to update"} , status:400
          end
        end

        def destroy
          if @user
            @user.destroy
            render json: {message: "Successfully Deleted"} , status:200
          else
            render json: {message: "Unable to Delete" , error: error} , status:400
          end
        end

        def userlogs
          if @user
            @logs = Log.where(user_id: @user.id)
            render json: {user: @user , logs:@logs , message: "Successfull"} , status:200
          else
            render json: {error: "No User Found"} , status:400
          end
        end

        def find_user
          @user = User.find(params[:id])
        end

        def user_params
          params.require(:user).permit(:email, :password, :name , :phoneno , :address)
        end

      end
    end
  end