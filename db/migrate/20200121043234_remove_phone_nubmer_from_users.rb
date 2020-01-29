# frozen_string_literal: true

class RemovePhoneNubmerFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :phone_nubmer, :string
  end
end
