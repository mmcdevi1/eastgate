class CreateBusinessPlans < ActiveRecord::Migration
  def change
    create_table :business_plans do |t|
      t.integer :asset_id
      t.string :title
      t.timestamps
    end
    add_attachment :business_plans, :business_plan_doc
  end
end
