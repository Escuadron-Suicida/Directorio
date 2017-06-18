class MessagesController < ApplicationController
  before_action :authenticate_business!, only: [:new]

  def index
    @messages = current_business.received_messages
  end

  def new
    @message = Message.new
    @sender = Business.find(params[:sender_id])
    @receiver = Business.find(params[:receiver_id])
  end

  def create
    @message = Message.create(message_params)

    @sender = Business.find(params[:sender_id])
    @receiver = Business.find(params[:receiver_id])

    @message.sender = @sender
    @message.receiver = @receiver

    @message.seen = false

    if @message.save
      redirect_to @message
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])

    if current_business == @message.receiver
      @message.seen = true
    end
  end

  private

  def message_params
    params.require(:message).permit(:content,
                                    :subject,
                                    :sender_id,
                                    :receiver_id)
  end
end
