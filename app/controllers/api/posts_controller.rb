require 'set'
module Api
  class PostsController < ApplicationController
    def index
      tags = ['tech', 'health', 'startups', 'history', 'design', 'science', 'politics', 'culture']
      
      @posts_array = []
      @set = Set.new
      @posts = ''
      
      tags.each do |tag|
        @posts = Post.get_posts(tag)
        break if @posts == 400
        
        @posts_array << @posts['posts']
        
      end

      @posts_array.each do |section|
        section.each do |post|
          @set << post
        end
      end

      if @posts == 400
        render json: { "error": "sortBy parameter is invalid" }, status: :bad_request
      else
        render json: @set

      end

    end
  end
end