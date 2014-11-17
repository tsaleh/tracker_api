module TrackerApi
  module Resources
    class Change
      include Virtus.model


      attribute :id, Integer
      attribute :change_type, String
      attribute :new_values, TrackerApi::Resources::Story
      attribute :name, String
      attribute :story_type, String
    end
  end
end


