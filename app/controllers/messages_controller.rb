class MessagesController < ApplicationController
  before_action :authenticate_business!

  def new
    @message = Message.new
    @sender = Business.find(params[:sender_id])
    @receiver = Business.find(params[:receiver_id])
  end

  def create
    @sender = Business.find(params[:message][:sender_id])
    @receiver = Business.find(params[:message][:receiver_id])

    @message = Message.new sender: @sender,
                           receiver: @receiver,
                           content: params[:message][:content]

    if @message.save
      redirect_to @message
    else
      render :new
    end
  end

  def show
  end

  private

  def message_params
    params.require(:message).permit(:content, :sender_id, :receiver_id)
  end
end
