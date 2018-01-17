class ApprovalsController < ApplicationController
  def index
    @approvals = Approval.all

    @approvals_extra = Array.new
    @approvals.each do |approval|
      @user = User.find(approval.User_id)
      if @user.user_type == 'admin'
        next
      end

      if @user.nil?
        puts "error"
      else
        puts approval.id
        @approvals_extra.push(approval)
      end
    end
  end
end
