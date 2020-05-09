class AddSubscriptionToEmails < ActiveRecord::Migration[6.0]
  def change
    add_column :emails, :subscription, :boolean, default: false
  end
end
