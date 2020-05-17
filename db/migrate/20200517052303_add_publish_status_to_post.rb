class AddPublishStatusToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :publish_status, :integer
  end
end
