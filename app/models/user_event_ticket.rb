class UserEventTicket < ApplicationRecord

  belongs_to :user
  belongs_to :event
  belongs_to :ticket, optional: true

  enum status: { 'registered' => 'registered', 'checked_in' => 'checked_in', 'cancelled' => 'cancelled' }, _prefix: true, _default: 'registered'
  
end
