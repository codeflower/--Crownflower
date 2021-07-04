class AddAccountToQrCodes < ActiveRecord::Migration[6.1]
  def change
    add_column :qr_codes, :account, :boolean
  end
end
