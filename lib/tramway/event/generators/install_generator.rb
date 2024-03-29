# frozen_string_literal: true

require 'rails/generators'
require 'tramway/generators/install_generator'

module Tramway::Event::Generators
  class InstallGenerator < ::Tramway::Generators::InstallGenerator
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    def run_other_generators
      generate 'tramway:partner:install'
    end

    def self.next_migration_number(path)
      next_migration_number = current_migration_number(path) + 1
      ActiveRecord::Migration.next_migration_number next_migration_number
    end

    def copy_migrations
      migrations = [
        :create_tramway_event_events,
        :add_photo_to_tramway_event_events,
        :create_tramway_event_participant_form_fields,
        :create_tramway_event_participants,
        :add_options_to_tramway_event_participant_form_fields,
        :add_position_to_tramway_event_participant_form_fields,
        :create_tramway_event_sections,
        :add_icon_to_tramway_event_sections,
        :add_position_to_tramway_event_sections,
        :add_status_to_tramway_event_events,
        :create_tramway_event_people,
        :create_tramway_event_people_sections,

        # NOTE must be removed until tramway-event 2.0
        :rename_tramway_event_people_sections_to_tramway_event_partakings,

        :add_position_to_tramway_event_partakings,
        :add_state_to_tramway_event_partakings,
        :add_more_fields_to_tramway_event_participants,

        # NOTE must be removed until tramway-event 2.0
        :rebuild_association_between_participant_and_partakings_to_polymorphic,

        :add_request_period_to_tramway_event_events,
        :add_description_to_tramway_event_people,

        :create_tramway_event_places,
        :create_tramway_event_events_places,
        :add_short_description_to_tramway_event_events,
        :create_tramway_event_actions,
        :add_reach_to_tramway_event_events,

        # NOTE must be removed until tramway-event 2.0
        :remove_status_from_tramway_event_events
      ]
      migrations.each do |migration|
        migration_template "#{migration}.rb", "db/migrate/#{migration}.rb"
      end
    end
  end
end
