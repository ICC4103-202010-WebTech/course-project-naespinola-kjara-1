class AupController < ApplicationController
  def index
    @ds = User.all
  end
end
