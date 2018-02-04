class Response < ActiveRecord::Base
  def self.import(file)
    require "roo"
    spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      response = find_by_id(row["id"]) || new
      response.attributes = row.to_hash.slice(*row.to_hash.keys)
      response.save!
    end
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end

  def next
    Response.where(["id > ?", id]).order('id').first
  end


end
