# == Schema Information
# Schema version: 20110630043115
#
# Table name: microposts
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Micropost < ActiveRecord::Base
  attr_accessible :item, :description, :location, :contact
  
  belongs_to :user
  
 # named_scope :search_by_term, lambda { |term| where(:title => term) }
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :item,        :presence => true, :length => { :maximum => 140 }
  validates :description, :presence => true, :length => { :maximum => 400 }
  validates :location,    :presence => true, :length => { :maximum => 140 }
  validates :contact,       :presence => true, :length => { :maximum => 140}
 
  
  # validates :content, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true 
  
  default_scope :order => 'microposts.created_at DESC'
  
    def self.search(search)
      if search
        find(:all, :conditions => ['item LIKE ?', "%#{search}%"])
      else
        find(:all) 
      end
    end
  
end
