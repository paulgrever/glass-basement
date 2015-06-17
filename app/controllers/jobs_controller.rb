require 'ostruct'

class JobsController < ApplicationController
  include JobsHelper

  def index
  end

  def show
    @job = Job.find_by(id: params[:id])
  end

  def create
    if params[:job_form][:new_region].present?
      @region = Region.find_or_create_by(place: params[:job_form][:new_region])
    else
      @region = Region.find_by(place: params[:job_form][:region])
    end
    if params[:job_form][:new_company].present?
      @company = Company.find_or_create_by(name: params[:job_form][:new_company])
      binding.pry
      @company.regions << @region unless @company.regions.exists?(@region.id)
    else
      @company = Company.find_by(name: params[:job_form][:company])
      @company.regions << @region unless @company.regions.exists?(@region.id)
    end
    
    @job = @company.jobs.build(title: params[:job_form][:title],
                   job_description: params[:job_form][:job_description])
    if @job.save
      redirect_to job_path(@job)
    else
      render :back
    end
  end

  private

  def job_params
    params.require(:job_form).permit(:title, :job_description, :job_id)
  end
end