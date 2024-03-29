# frozen_string_literal: true

Rails.application.config.after_initialize do
  Tramway.set_available_models(
    [
      Tramway::Event::Event,
      Tramway::Event::ParticipantFormField,
      Tramway::Event::Participant,
      Tramway::Event::Section,
      Tramway::Event::Person,
      Tramway::Event::Partaking,
      Tramway::Event::Place,
      Tramway::Event::Action
    ],
    project: :event
  )
  Tramway.set_notificable_queries new_participants: lambda { |current_user|
    Tramway::Event::Participant.where(participation_state: :requested).send "#{current_user.role}_scope", current_user.id
  }

  Tramway::Landing.head_content = lambda do
    javascript_include_tag 'tramway/event/application'
  end
end
