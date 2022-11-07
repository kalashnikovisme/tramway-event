# frozen_string_literal: true

class Tramway::Event::Person < ::Tramway::Core::ApplicationRecord
  has_many :partakings, class_name: 'Tramway::Event::Partaking'

  mount_uploader :photo, PhotoUploader
end
