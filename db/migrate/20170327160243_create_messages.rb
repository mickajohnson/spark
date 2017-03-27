class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :match
      t.text :message
      t.references :sender
      t.references :receiver

      t.timestamps
    end
  end
end
