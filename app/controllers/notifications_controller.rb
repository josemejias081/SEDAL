class NotificationsController < ApplicationController
  def evaluation 
    @group = Group.find(params[:group_id])
    @evaluation = Evaluation.find(params[:evaluation_id])
    @group.users.each do |user|
      SendEvaluationMailer.notify(current_user, user, @evaluation).deliver_now!
    end
    redirect_to @group, notice: "Evaluación enviada"
  end
end

