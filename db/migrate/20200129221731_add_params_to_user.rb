# frozen_string_literal: true

class AddParamsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :ssn, :integer
    add_column :users, :company, :string
  end
end
