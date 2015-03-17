class CreateRatingVotes < ActiveRecord::Migration
  def change
    create_table :rating_votes do |t|
      t.belongs_to :user, index: true
      t.belongs_to :poll, index: true
      t.string :direction

      t.timestamps
    end
  end
end
