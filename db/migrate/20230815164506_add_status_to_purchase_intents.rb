class AddStatusToPurchaseIntents < ActiveRecord::Migration[7.0]
  def change
    add_column :purchase_intents, :status, :string, default: 'pending'
    add_column :purchase_intents, :token, :string
  end
end
