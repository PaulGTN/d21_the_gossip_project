class GossipTag < ApplicationRecord
  belongs_to :gossip 
  belongs_to :tag
  validates :gossip_id, presence: true  
  validates :tag_id, presence: true  
end
