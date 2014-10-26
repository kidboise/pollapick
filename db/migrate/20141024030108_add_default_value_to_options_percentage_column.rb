class AddDefaultValueToOptionsPercentageColumn < ActiveRecord::Migration
  def change
  	change_column :options, :percentage, :integer, :default => 0
  end
end
