class Setting < ApplicationRecord
  def self.get(name, default)
    setting = Setting.find_by(key: name)

    if setting
      setting.value
    else
      default
    end
  end

  def self.set(name, value)
    setting = Setting.find_by(key: name)

    if setting
      setting.update(value: value)
    else
      Setting.create(key: name, value: value)
    end
  end
end
