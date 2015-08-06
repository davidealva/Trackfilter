class AddAttachmentCoverToReleases < ActiveRecord::Migration
  def self.up
    change_table :releases do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :releases, :cover
  end
end
