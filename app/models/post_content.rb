class PostContent < ApplicationRecord
    validates :post_id, {presence: true}
    validates :image_name, {presence: true}
end
