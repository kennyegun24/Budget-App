class ChangeColumnDeault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :groups, :icon, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfx8oO15Gf04_xa6NQ1aw2w-DRTm73z4F9hA&usqp=CAU'
  end
end
