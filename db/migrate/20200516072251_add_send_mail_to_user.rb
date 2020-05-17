class AddSendMailToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :send_mail, :boolean
  end
end
