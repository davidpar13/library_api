class Membership < ApplicationRecord
  belongs_to :member
  belongs_to :library
  has_many :fees
  has_many :rental_transactions

  scope :by_member, ->(member_id, library_id) {where(member_id: member_id, library_id: library_id)}

  def self.check_membership(member_id, library_id)
    membership = Membership.find_by(member_id: member_id, library_id: library_id)
    unless membership.present?
      Membership.create!(member_id: member_id, library_id: library_id)
    end
  end

  def outstanding_fees?
    self.fees.each do |f|
      if f.paid != true && f.amount > 0.0
        return true
      else
        return false
      end
    end
  end

  def books_returned_for_membership?
    self.rental_transactions.each do |rt|
      if rt.book.checked_out && rt.book.return_by < Time.zone.today
        return true
      else
        return false
      end
    end
  end

end
