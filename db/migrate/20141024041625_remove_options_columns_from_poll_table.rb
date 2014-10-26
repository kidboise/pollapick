class RemoveOptionsColumnsFromPollTable < ActiveRecord::Migration
  def change
  	remove_column :polls, :option_one, :string
  	remove_column :polls, :option_two, :string
  	remove_column :polls, :option_three, :string
  	remove_column :polls, :option_four, :string
  	remove_column :polls, :option_five, :string
  end
end
