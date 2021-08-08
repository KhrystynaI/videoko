require 'csv'

class UpdateMutualSettlementJob < ApplicationJob
  queue_as :default


  def perform(csv_path)
    csv_file = Rails.root.join("upload",csv_path)
    user = Spree::User.find_by(sku: CSV.foreach(csv_file, headers: false, encoding: 'windows-1251:utf-8').first[0])
    date_from = DateTime.strptime(CSV.foreach(csv_file, headers: false, encoding: 'windows-1251:utf-8').first[1], "%d.%m.%y")
    date_to = DateTime.strptime(CSV.foreach(csv_file, headers: false, encoding: 'windows-1251:utf-8').first[2], "%d.%m.%y")
    @mutual_settlement = Spree::MutualSettlement.create(user_id: user.id, date_from: date_from, date_to: date_to)
    @var = ""
    CSV.foreach(csv_file, headers: false, encoding: 'windows-1251:utf-8') do |row|
      case row[3]
      when "return"
        if @var != row[4]
        @return_invoice = Spree::ReturnInvoice.create(mutual_settlement_id: @mutual_settlement.id,
         name: row[4],
         date: DateTime.strptime(row[5], "%d.%m.%y"),
         income_total_usd: row[8]
          )
        Spree::InvoiceItem.create(name: row[9], quantity: row[10],
         price: row[11],
         final_price: row[12],
         return_invoice_id: @return_invoice.id)
          @var = row[4]
       else
         Spree::InvoiceItem.create(name: row[9], quantity: row[10],
          price: row[11],
          final_price: row[12],
          return_invoice_id: @return_invoice.id)
          @var = row[4]
       end
      when "income"
        Spree::IncomeInvoice.create(
          mutual_settlement_id: @mutual_settlement.id,
          name: row[4],
          date: DateTime.strptime(row[5], "%d.%m.%y"),
          income_usd: row[7],
          income_total_usd: row[8]
            )
      when "sales"
        if @var != row[4]
        @sales_invoice = Spree::SalesInvoice.create(
          mutual_settlement_id: @mutual_settlement.id,
          name: row[4],
          date: DateTime.strptime(row[5], "%d.%m.%y"),
          debt_total_usd: row[8]
          )
        Spree::InvoiceItem.create(name: row[9], quantity: row[10],
         price: row[11],
         final_price: row[12],
         sales_invoice_id: @sales_invoice.id)
         @var = row[4]
       else
         Spree::InvoiceItem.create(name: row[9], quantity: row[10],
          price: row[11],
          final_price: row[12],
          sales_invoice_id: @sales_invoice.id)
          @var = row[4]
       end
     end
    end
    File.delete(csv_file)
    @mutual_settlement.sales_invoices.each do |sales|
      sum = sales.invoice_items.map{|c|c.final_price}.sum
      sales.update(debt_usd: sum)
  end
  @mutual_settlement.return_invoices.each do |ret|
    sum = ret.invoice_items.map{|c|c.final_price}.sum
    ret.update(income_usd: sum)
  end

end
end
