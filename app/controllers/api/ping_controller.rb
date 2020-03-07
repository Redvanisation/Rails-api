module Api
  class PingController < ApplicationController
    def index
      @res = Post.get_posts('tech')
      render json: { "success": true } if @res

      # debugger
    end
  end
end