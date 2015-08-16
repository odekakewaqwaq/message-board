class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update]
  
  def index
    @messages = Message.all
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    if  @message.save
      redirect_to root_path , notice:'メッセージを保存しました'
    else
      #メッセ〜ジが保存できなかった時
      @messages = Message.all
      flash.now[:alert]="メッセージの保存に失敗しました"
      render 'index'
    end
  end
  
  def edit
  end
    
  def update
    if @message.update(meassage_params)
      redirect to root_path , notice:'メッセージを編集しました'
    else
      render 'edit'
  end
  
  private
  
  def message_params
    params.require(:message).permit(:name, :body)
  end
  
  def set_message
    @message = Meassage.find(params[:id])
  end
end
