class AddPhotoToServices < ActiveRecord::Migration[6.0]
  def change
    add_column :services, :photo, :string
  end
end
