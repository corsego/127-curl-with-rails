class HomeController < ApplicationController
  protect_from_forgery with: :null_session

  # curl -X GET http://localhost:3000/index\?foo\=yaro
  def index
    render plain: "hello world #{request.params[:foo]}"
  end

  # curl -X POST -d 'name=shm' http://localhost:3000/post_example
  def post_example
    # render plain: "hello world #{request.params[:foo]}"
    render plain: request.body.read
  end
end