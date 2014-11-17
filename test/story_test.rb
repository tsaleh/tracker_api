require_relative 'minitest_helper'

describe TrackerApi::Resources::Story do
  let(:pt_user) { PT_USER_1 }
  let(:client) { TrackerApi::Client.new token: pt_user[:token] }
  let(:project_id) { pt_user[:project_id] }
  let(:project) { VCR.use_cassette('get project') { client.project(project_id) } }

  describe '.tasks' do
    it 'gets all tasks for this story' do
      VCR.use_cassette('get tasks', record: :new_episodes) do
        tasks = project.story('66728004').tasks

        tasks.wont_be_empty
        task = tasks.first
        task.must_be_instance_of TrackerApi::Resources::Task
      end
    end

    it 'gets all tasks even when the project_id is excluded from the story fields' do
      VCR.use_cassette('get tasks when stories filtered', record: :new_episodes) do
        stories = project.stories(with_state: 'unstarted', fields: 'name,story_type')
        stories.each do |story|
          tasks = story.tasks
          unless tasks.empty?
            task = tasks.first
            task.must_be_instance_of TrackerApi::Resources::Task
          end
        end
      end
    end
  end

  describe '.activity_events' do
    it 'gets all activity events for this story' do
      VCR.use_cassette('get activity', record: :new_episodes) do
        activity_events = project.story('66728004').activity_events

        activity_events.wont_be_empty
        activity_event = activity_events.first
        activity_event.must_be_instance_of TrackerApi::Resources::ActivityEvent

        activity_event.changes.wont_be_empty
        change = activity_event.changes.first
        change.must_be_instance_of TrackerApi::Resources::Change
        change.new_values.must_be_instance_of TrackerApi::Resources::Story
      end
    end
  end
end
