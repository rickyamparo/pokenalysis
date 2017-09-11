class AddUserIdToBattles < ActiveRecord::Migration[5.1]
  def change
    add_reference :battles, :user, index: true, foreign_key: true
  end
end
