class UsersController < ApplicationController


  def new
    @user = User.new
  end



  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
   if @user.save
     session[:user_id] = @user.id
     redirect_to '/'
   else
     redirect_to '/signup'
   end
 end



  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
end
