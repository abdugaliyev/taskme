class VerificationsController < ApplicationController

	def new
		@verification = Verification.new
	end

	def create
		@verification = current_user.verifications.build(verifications_params)
		if @verification.save
			flash[:success] = "Поздравляем Вы успешно подали заявку в исполнители в ближайшее время с вами свяжется наш специалист и сообщит о наше решении"
			redirect_to user_path(current_user)
		else
    		render 'new'
    	end
	end

	def show
		@verification = Verification.find(params[:id])
	end

	def index
		@verifications = Verification.all
	end

	def destroy
		@user = User.find(params[:user_id])
		@verification = Verification.find(params[:id])
	end

	private

	def verifications_params
		params.require(:verification).permit(:user_id, :first_name, :last_name, :second_name, :birthday, :phone, :tpname, :tprelation, :tpphone, :tp1name, :tp1relation, :tp1phone, :firstverification, :verificationinformright, :kzcitizen)
	end
end
