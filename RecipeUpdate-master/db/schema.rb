# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_904_120_721) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.text 'comment'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'recipe_id'
    t.integer 'user_id'
  end

  create_table 'recipes', force: :cascade do |t|
    t.string 'title'
    t.text 'description'
    t.string 'author'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'user_id'
    t.integer 'category_id'
    t.string 'recipe_img_file_name'
    t.string 'recipe_img_content_type'
    t.bigint 'recipe_img_file_size'
    t.datetime 'recipe_img_updated_at'
    t.integer 'cached_votes_total', default: 0
    t.integer 'cached_votes_score', default: 0
    t.integer 'cached_votes_up', default: 0
    t.integer 'cached_votes_down', default: 0
    t.integer 'cached_weighted_score', default: 0
    t.integer 'cached_weighted_total', default: 0
    t.float 'cached_weighted_average', default: 0.0
  end

  create_table 'rs_evaluations', id: :serial, force: :cascade do |t|
    t.string 'reputation_name'
    t.string 'source_type'
    t.integer 'source_id'
    t.string 'target_type'
    t.integer 'target_id'
    t.float 'value', default: 0.0
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.text 'data'
    t.index %w[reputation_name source_id source_type target_id target_type], name: 'index_rs_evaluations_on_reputation_name_and_source_and_target', unique: true
    t.index ['reputation_name'], name: 'index_rs_evaluations_on_reputation_name'
    t.index %w[source_id source_type], name: 'index_rs_evaluations_on_source_id_and_source_type'
    t.index %w[target_id target_type], name: 'index_rs_evaluations_on_target_id_and_target_type'
  end

  create_table 'rs_reputation_messages', id: :serial, force: :cascade do |t|
    t.string 'sender_type'
    t.integer 'sender_id'
    t.integer 'receiver_id'
    t.float 'weight', default: 1.0
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.index %w[receiver_id sender_id sender_type], name: 'index_rs_reputation_messages_on_receiver_id_and_sender', unique: true
    t.index ['receiver_id'], name: 'index_rs_reputation_messages_on_receiver_id'
    t.index %w[sender_id sender_type], name: 'index_rs_reputation_messages_on_sender_id_and_sender_type'
  end

  create_table 'rs_reputations', id: :serial, force: :cascade do |t|
    t.string 'reputation_name'
    t.float 'value', default: 0.0
    t.string 'aggregated_by'
    t.string 'target_type'
    t.integer 'target_id'
    t.boolean 'active', default: true
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.text 'data'
    t.index %w[reputation_name target_id target_type], name: 'index_rs_reputations_on_reputation_name_and_target', unique: true
    t.index ['reputation_name'], name: 'index_rs_reputations_on_reputation_name'
    t.index %w[target_id target_type], name: 'index_rs_reputations_on_target_id_and_target_type'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
