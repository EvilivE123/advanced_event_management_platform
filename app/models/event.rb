class Event < ApplicationRecord
  has_many_attached :images

  belongs_to :organization, class_name: "User"

  validates :title, uniqueness: true, presence: true
  validates_presence_of :description, :start_time, :end_time, :location, :capacity, :event_type
  validate :validate_event_type

  enum status: { 'open' => 'open', 'running' => 'running', 'closed' => 'closed' }, _prefix: true, _default: 'open'

  private

  def validate_event_type
    event_type = ConfigurationSetting.find_by(name: 'event_types')
    raise 'Please add user roles' if event_type.blank?
    
    if event_type.present? && event_type.value.exclude?(self.event_type)
      errors.add(:event_type, 'is invalid')
    end
  end

end
