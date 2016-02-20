class DeviseCreate<%= table_name.camelize.singularize %>Audits < ActiveRecord::Migration
  def change
    create_table :<%= table_name.singularize %>_audits do |t|
      t.references  :<%= table_name.singularize %>
      t.string      :action
      t.datetime    :action_occured_at
      t.string      :client_ip
      t.string      :user_agent
    end

    add_index :<%= table_name.singularize %>_audits, :<%= table_name.classify.foreign_key %>
  end
end
