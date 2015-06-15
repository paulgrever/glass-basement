class JobsController < ApplicationController
  def index
  end

  def show
    @job = Job.find_by(id: params[:id])
  end
end
