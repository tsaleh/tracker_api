module TrackerApi
  module Resources
    class ActivityEvent
      include Virtus.model

      attribute :client

      attribute :guid, String
      attribute :project_id, Integer
      attribute :project_version, Integer
      attribute :story_id, Integer
      attribute :message, String
      attribute :highlight, String
      attribute :occurred_at, DateTime
      attribute :kind, String # Should always be story_update_activity
      attribute :changes, Array[TrackerApi::Resources::Change]
      attribute :primary_resources, Array[Hash]
      attribute :project, TrackerApi::Resources::Project
      attribute :performed_by, TrackerApi::Resources::Person
    end
  end
end

