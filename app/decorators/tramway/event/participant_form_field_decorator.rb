# frozen_string_literal: true

class Tramway::Event::ParticipantFormFieldDecorator < ::Tramway::ApplicationDecorator
  class << self
    def collections
      [:all]
    end

    def list_attributes
      [:event_title]
    end

    def show_attributes
      %i[id title description field_type event_title state created_at updated_at options position]
    end
  end

  delegate_attributes :description, :options, :position

  def title
    "#{object.title} #{object.event.title}"
  end

  def event_title
    object.event.title
  end

  def field_type
    enumerize_view object.field_type
  end

  def state
    state_machine_view object, :state
  end

  def created_at
    date_view object.created_at
  end

  def updated_at
    date_view object.updated_at
  end
end
