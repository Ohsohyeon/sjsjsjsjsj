class AddNewToWebtoons < ActiveRecord::Migration
  def change
    add_column :webtoons, :bring_day, :string
  end
end
