class AddVacancyToOpening < ActiveRecord::Migration[6.0]
  def change
    add_column :openings, :vacancy, :integer
  end
end
