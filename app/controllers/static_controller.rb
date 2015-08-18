class StaticController < ApplicationController

  skip_before_action :authenticate_user!

  def faq
  end

  def about
  end

end
