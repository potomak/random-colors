class ColorsController < ApplicationController
  DEFAULT_COLOR = '#00ccff'

  respond_to :json

  def show
    @color = Color.order(created_at: :desc).limit(1).first

    respond_with @color
  end
end
