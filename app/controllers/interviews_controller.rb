class InterviewsController < ApplicationController
  def create
    @interview = Interview.new(interview_params)
    if @interview.save
      redirect_to job_path(@interview.job.id)
    else
      render :back
    end
  end

  private

  def interview_params
    params.require(:interview_form).permit(:title,
                                           :job_id,
                                           :number,
                                           :interview_type,
                                           :details,
                                           :date,
                                           :time_between,
                                           :questions,
                                           :user_id,
                                           :interviewer_name,
                                           :interviewer_email,
                                           :interviewer_phone)
  end
end
