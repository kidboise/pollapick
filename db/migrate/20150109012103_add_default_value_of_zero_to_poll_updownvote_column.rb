class AddDefaultValueOfZeroToPollUpdownvoteColumn < ActiveRecord::Migration
  def change
  	change_column :polls, :updownvote, :integer, :default => 0
  end
end
