class AddCcTokenToUser < ActiveRecord::Migration
  def change
    add_column :customers, :cc_token, :string
  end
end
