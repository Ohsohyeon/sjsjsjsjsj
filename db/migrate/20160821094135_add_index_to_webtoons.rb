
require_relative '20160821094135_add_index_to_webtoons_migration'

class AddIndexToWebtoons < ActiveRecord::Migration
  def change
    add_column :webtoons, :url, :string
  end
end
