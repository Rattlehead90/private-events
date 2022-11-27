class EventAttendancesController < ApplicationController
  def create
    event = Event.find(params[:id])
    attendance = Event_attendance.new
    attendance.attended_event = event
    attendance.attendee = current_user

    if attendance.save
      redirect_to event
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
  end

  def update
  end
end
