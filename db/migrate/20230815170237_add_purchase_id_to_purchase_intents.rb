class AddPurchaseIdToPurchaseIntents < ActiveRecord::Migration[7.0]
  def change
    add_column :purchase_intents, :purchase_id, :integer
  end
end
