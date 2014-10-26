class ChangeOptionPercentageToPicks < ActiveRecord::Migration
  def change
  	rename_column :options, :percentage, :picks
  end
end
