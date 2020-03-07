class ApplicationRecord < ActiveRecord::Base
  include HTTParty
  self.abstract_class = true
  base_uri 'https://hatchways.io/api/assessment/blog/posts'
  
  
  def self.get_posts(tags, sort_by = 'id', direction = 'asc')
    @options = { query: { tag: tags, sortBy: sort_by, direction: direction } }
    
    sort_by_values = ['id', 'reads', 'likes', 'popularity']
    directions = ['asc', 'desc']
    
    if !sort_by_values.include?(sort_by) || !directions.include?(direction)
      400
    else
      get(base_uri, @options)
    end

  end
end
