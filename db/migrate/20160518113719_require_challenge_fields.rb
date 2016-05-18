class RequireChallengeFields < ActiveRecord::Migration
  def self.up
    Event.create :id => 'db73f578-b6f3-4493-a4e7-74c0c2fff52e', :name => '2016 Presidential Primary'
    Challenge.update_all({:event_id => 'db73f578-b6f3-4493-a4e7-74c0c2fff52e'})
  end
end
