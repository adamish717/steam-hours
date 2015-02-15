class Entry < ActiveRecord::Base
  belongs_to :purchase_order
  has_one :client, through: :purchase_order
  belongs_to :user
  validates :description, :start_at, :end_at, :purchase_order, :user, presence: true
  validate :start_must_be_before_end

  def duration
    (self.start_at .. self.end_at)
  end

  private

  def start_must_be_before_end
    return unless start_at.present? and end_at.present?
    errors.add(:end_at, 'must be later than start time') unless start_at < end_at
  end
end
