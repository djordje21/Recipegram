# frozen_string_literal: true

class AddDataToEvaluations < ActiveRecord::Migration[4.2]
  def self.up
    add_column :rs_evaluations, :data, :text
  end

  def self.down
    remove_column :rs_evaluations, :data
  end
end
