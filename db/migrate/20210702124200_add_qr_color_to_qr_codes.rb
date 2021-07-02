# frozen_string_literal: true

class AddQrColorToQrCodes < ActiveRecord::Migration[6.1]
  def change
    add_column :qr_codes, :qr_color, :text
  end
end
