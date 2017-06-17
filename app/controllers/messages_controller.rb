class MessagesController < ApplicationController
  before_action :authenticate_business!

  def index
    @messages = current_business.messages
  end

  def new
    @message = Message.new
    @sender = Business.find(params[:sender_id])
    @receiver = Business.find(params[:receiver_id])
  end

  def create
    @message = Message.create(message_params)

    if @message.save
      redirect_to @message
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_id, :receiver_id)
  end
end
