class CreatePolls < ActiveRecord::Migration
  def change
    create_table :polls do |t|
      t.string :question
      t.string :option_one
      t.string :option_two
      t.string :option_three
      t.string :option_four
      t.string :option_five
      t.integer :updownvote

      t.timestamps
    end
  end
end
