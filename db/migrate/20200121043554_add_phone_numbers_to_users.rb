# frozen_string_literal: true

class AddPhoneNumbersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone_number, :string
  end
end
