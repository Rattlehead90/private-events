class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event = current_user.build_event(event_params)

    if @event.save 
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :date)
  end
end