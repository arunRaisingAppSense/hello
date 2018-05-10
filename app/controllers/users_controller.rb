class UsersController < Devise::InvitationsController
	def create
   		@user = User.new(user_params)
    	respond_to do |format|
      		if @user.save
        		format.html { redirect_to @user, notice: 'User was successfully created.' }
      		else
        		format.html { render :new }
      		end
    	end
  	end
  	 private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:mobile_no, :company_name)
    end
end