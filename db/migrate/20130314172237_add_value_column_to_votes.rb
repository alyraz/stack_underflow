class AddValueColumnToVotes < ActiveRecord::Migration
  def change
    add_column :votes, :value, :integer, :null => false, :default => 0 
  end
end
