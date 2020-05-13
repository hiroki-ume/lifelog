class AddColumnToPostsSendMail < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :send_mail, :boolean
  end
end
