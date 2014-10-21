class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :option_text
      t.integer :percentage
      t.integer :poll_id

      t.timestamps
    end
  end
end
