class Membership < ApplicationRecord
  belongs_to :member
  belongs_to :library

  scope :by_member, ->(member_id, library_id) {where(member_id: member_id, library_id: library_id)}

  def self.check_membership(member_id, library_id)
    membership = Membership.find_by(member_id: member_id, library_id: library_id)
    unless membership.present?
      Membership.create!(member_id: member_id, library_id: library_id)
    end
  end
end
