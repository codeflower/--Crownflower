class AddQrBgColorToQrCodes < ActiveRecord::Migration[6.1]
  def change
    add_column :qr_codes, :qr_bg_color, :text
  end
end
