class AddImgUrlToComedian < ActiveRecord::Migration[5.1]
  def change
    add_column :comedians, :img_url, :string
  end
end
