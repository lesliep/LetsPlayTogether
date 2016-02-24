class FriendshipsController < ApplicationController
  before_action :get_friendship, :only => [:accept, :reject]

  def create
    from_id = current_user.id
    to_id = params[:id]
    Friendship.create(:from_id => from_id,
                      :to_id => to_id,
                      :accepted => false
                     )
  end

  def update
    @friendship.update_attributes(:accepted => true)
  end

  def destroy
    @friendship.destroy
  end


  private

  def get_friendship
    @friendship = Friendship.where(:to_id => current_user.id,
                                  :from_id => params[:id]).first
  end
end
