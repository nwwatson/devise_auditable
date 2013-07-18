class DeviseCreate<%= table_name.camelize.singularize %>Audits < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name.singularize %>_audits do |t|
      t.integer  :<%= table_name.classify.foreign_key  %>
      t.string    "action"
      t.datetime  "action_occured_at"
      t.string    "client_ip"
      t.string    "user_agent"
    end

    add_index :<%= table_name.singularize %>_audits, :<%= table_name.classify.foreign_key  %>
  end

  def self.down
    drop_table :<%= table_name.singularize %>_audits
  end
end