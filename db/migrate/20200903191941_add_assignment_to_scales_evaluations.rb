class AddAssignmentToScalesEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :scores, default: Time.zone.now
    add_timestamps :evaluations, default: Time.zone.now
  end
end
