# frozen_string_literal: true

class Tramway::Event::PlaceDecorator < Tramway::ApplicationDecorator
  delegate :title, to: :object
end
