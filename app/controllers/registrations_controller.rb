class RegistrationsController < Devise::RegistrationsController
  # def create
  #  		@user = User.new(user_params)
  #   	respond_to do |format|
  #     		if @user.save
  #       		format.html { redirect_to root_path, notice: 'User was successfully created.' }
  #     		else
  #       		format.html { render :new }
  #     		end
  #   	end
  # 	end

  	def update
    	respond_to do |format|
      		if @user.update(user_params)
        		format.html { redirect_to root_path, notice: 'User was successfully updated.' }
      		else
        		format.html { render :edit }
      		end
    	end
  	end

  	private
    def user_params
      params.require(:user).permit(:email, :password, :mobile_no, :company_name)
    end

end