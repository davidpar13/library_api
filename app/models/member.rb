class Member < ApplicationRecord
  has_many :memberships

  def self.new_member?(name)
    Member.find_by_name(name).present? ? false : true
   end


end
