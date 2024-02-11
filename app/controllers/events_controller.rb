class EventsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create_event
    case event_params[:event_name]
    when 'Event A'
      event = EventA.new(event_params)
    when 'Event B'
      event = EventB.new(event_params)
    end
    if event.save
      render json: { event: 'created successfully'}, status: :ok
    end
  end

  private

  def event_params
    params.require(:event).permit(:email, :user_id, :campaign_id, :message_id, :event_name, :template_id, :created_by,  data_field: {})
  end
end