class TosController < ApplicationController
  def index
    @ds = User.all
  end
end
