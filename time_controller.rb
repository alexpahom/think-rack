require './time_service'

class TimeController

  def call(env)
    response = Rack::Request.new(env)
    time_service = TimeService.new(response)
    if time_service.errors.empty?
      respond_with(time_service.parse, 200)
    else
      respond_with(time_service.errors, 400)
    end
  end

  private

  def respond_with(body, status)
    Rack::Response.new(body, status).finish
  end
end
