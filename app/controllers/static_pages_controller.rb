class StaticPagesController < ApplicationController
  before_action :authenticate_user!
  def learn
  end

  def tactics
  end

  def historical
  end
end
