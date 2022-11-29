class EventAttendancesController < ApplicationController
  def create
    @attendance = current_user.event_attendances.build(event_attendance_params)

    if @attendance.save
      flash[:success] = 'Great! See you at the event!'
      redirect_to @attendance
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = EventAttendance.find_by(attended_event_id: params[:id], attendee_id: current_user.id)
    @attendance.destroy

    flash[:success] = 'Your attendance has been cancelled'
    redirect_to event_path
  end
  
  private

  def event_attendance_params
    params.require(:event_attendance).permit(:attendee_id, :attended_event_id)
  end
end
