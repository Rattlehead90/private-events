class EventAttendancesController < ApplicationController
  def create
    @attendance = current_user.event_attendances.build(event_attendance_params)

    if @attendance.save
      redirect_to root_path
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = EventAttendance.find_by(attended_event_id: params[:id])
    @attendance.destroy

    redirect_to event_path
  end
  
  private

  def event_attendance_params
    params.require(:event_attendance).permit(:attendee_id, :attended_event_id)
  end
end
