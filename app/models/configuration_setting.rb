class ConfigurationSetting < ApplicationRecord

  validate :values_based_on_models

  private

  def values_based_on_models
    if name == 'user_roles'
      stored_data = User.pluck(:role).uniq
      existing_values = self.value
    elsif name == 'event_types'
      stored_data = Event.pluck(:event_type).uniq
      existing_values = self.value
    end
    if stored_data.present?
      remaining_val = stored_data - existing_values
      raise "#{remaining_val} is missing in value" if remaining_val.present?
    end
  end

end
