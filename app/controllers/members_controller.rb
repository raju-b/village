class MembersController < ApplicationController
   def create
    @family = Family.find(params[:family_id])
    puts "#"*10
    puts member_params.inspect
    puts "#"*10
    @member = @family.members.create(member_params)
    redirect_to family_path(@family)
  end

	def destroy
    @family = Family.find(params[:family_id])
    @member = @family.members.find(params[:id])
    @member.destroy
    redirect_to family_path(@family)
  end
 
  private
    def member_params
      params.require(:member).permit(:name, :age, :gender)
    end
end
