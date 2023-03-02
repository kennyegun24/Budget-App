class ChangeColumnDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :groups, :icon, 'https://th.bing.com/th/id/OIP.SxHhCgsreltW3bRm01VCrgHaHa'
  end
end
