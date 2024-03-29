# frozen_string_literal: true

class Tramway::Event::Person < ::Tramway::ApplicationRecord
  has_many :partakings, class_name: 'Tramway::Event::Partaking'

  mount_uploader :photo, PhotoUploader

  search_by :first_name, :last_name
end
