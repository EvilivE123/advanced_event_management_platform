class Ticket < ApplicationRecord

  belongs_to :event

  validates_presence_of :ticket_type, :price

  enum status: { 'open' => 'open', 'booked' => 'booked', 'invalid' => 'invalid' }, _prefix: true, _default: 'open'
end
