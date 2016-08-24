class AddWtnameToWebtoons < ActiveRecord::Migration
  def change
    add_column :webtoons, :wtname, :string
  end
end
