namespace :qr_codes do
  task delete_invalid_records: :environment do
    qr_codes = QrCode.where(name: "google")
    if qr_codes.count > 0
      qr_codes.destroy_all
      puts "All record have been deleted"
    else
      puts "Nothing to delete"
    end
  end
end