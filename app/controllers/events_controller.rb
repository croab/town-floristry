class EventsController < ApplicationController
  before_action :set_event, only: %i[ show create edit destroy ]
  def index
    @events = policy_scope(Event)
  end

  def show
    authorize @event
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    if @event.save!
      redirect_to events_path, notice: "Event was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
    authorize @event
  end

  def edit
    authorize @event
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "Event was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
    authorize @event
  end

  def destroy
    @event.destroy
    redirect_to events_url, status: :see_other, notice: "Event was successfully destroyed."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :date, :time, :theme, :price, :summary, :description, :location)
  end
end
