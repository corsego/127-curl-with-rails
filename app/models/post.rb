class Post < ApplicationRecord
  broadcasts_to ->(post) { :posts_list }
end
