# frozen_string_literal: true

class Admin::Tramway::Event::ActionForm < Tramway::ApplicationForm
  properties :title, :action_state_event, :deadline

  association :event

  def initialize(object)
    super(object).tap do
      form_properties event: :association,
                      title: :string,
                      deadline: :date_picker
    end
  end
end
