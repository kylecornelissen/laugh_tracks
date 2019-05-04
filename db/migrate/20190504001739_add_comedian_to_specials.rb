class AddComedianToSpecials < ActiveRecord::Migration[5.1]
  def change
    add_reference :specials, :comedian, foreign_key: true
  end
end
