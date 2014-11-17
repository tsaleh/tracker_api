module TrackerApi
  module Endpoints
    class ActivityEvents
      attr_accessor :client

      def initialize(client)
        @client = client
      end

      def get(project_id, story_id,  params={})
        data = client.paginate("/projects/#{project_id}/stories/#{story_id}/activity", params: params)
        raise TrackerApi::Errors::UnexpectedData, 'Array of activity events expected' unless data.is_a? Array

        data.map do |activity_event|
          Resources::ActivityEvent.new({ client: client, project_id: project_id, story_id: story_id}.merge(activity_event))
        end
      end
    end
  end
end

