require 'set'
module Api
  class PostsController < ApplicationController
    def index
      @posts = Post.get_posts('tech')
      if @posts == 1
        render @posts
      elsif @posts == 2
        render json: { "error": "sortBy parameter is invalid" }, status: :bad_request
      else
        render json: @posts
        # @set = Set.new
  
        # @posts.each do |o|
        #   render json: o
        #   # render json: 'boooooo'
        
        # end
        # render json: @set
      end


      # debugger
    end
  end
end