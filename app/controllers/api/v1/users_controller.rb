module Api
   module V1
      class UsersController < ApplicationController
         def index
            users = User.order('created_at DESC')
            render json: UserSerializer.new(users).to_serialized_json #{ status: 'SUCCESS', message: 'Users Loaded', data: users }, status: :ok
         end
         
         def show
            user = User.find(params[:id])
            render json: UserSerializer.new(user).to_serialized_json #{ status: 'SUCCESS', message: 'User Loaded', data: user }, status: :ok
         end

         def create
            user = User.new(user_params)
            if user.save
               render json: { status: 'SUCCESS', message: 'User Saved', data: user }, status: :ok
            else
               render json: { status: 'ERROR', message: 'User NOT Saved', data:user.errors}, status: :unprocessable_entity
            end
         end

         def destroy
            user = User.find(params[:id])
            user.destroy

            render json: { status: 'SUCCESS', message: 'User DELETED', data: user }, status: :ok

         end

         private

         def user_params
            params.require(:user).permit(:name, :email, :password_digest)
         end

      end
   end
end