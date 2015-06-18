class ChatsController < ApplicationController
  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      $redis.publish(@chat.job_id, @chat.to_json)
      render json: @chat
    else
      flash[:error] = "Invalid Message"
      redirect_to :back
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:body, :user_id, :job_id)
  end
end
