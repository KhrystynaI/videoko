class MutualSettlementPdf < Prawn::Document
  def initialize(mutual_settlement, documents)
    super(:page_size => "A4", :page_layout => :landscape)
    font_setup
    @mutual_settlement = mutual_settlement
    @documents = documents
    text_content
    table_content
    #text_summary
  end

  def font_setup
    font_families.update("SourceSansPro" => {
      :bold => "vendor/assets/fonts/SourceSansPro-Bold.ttf",
      :normal => "vendor/assets/fonts/SourceSansPro-Regular.ttf",
    })
    font "SourceSansPro"
  end

  def item_header
    [{:content => "#{Spree.t("document")}", :colspan => 3,:background_color => "85F03B"},
     {:content => "#{Spree.t("header_debt")}", :colspan => 3,:background_color => "85F03B"}]
  end

  def item_header_second
    [{:content => "#{Spree.t("document")}", :background_color => "85F03B"},
      {:content => "#{Spree.t("number_name")}", :background_color => "85F03B"},
      {:content => "#{Spree.t("date")}", :background_color => "85F03B"},
      {:content => "#{Spree.t("increase_table")}", :background_color => "85F03B"},
      {:content => "#{Spree.t("decrease_table")}", :background_color => "85F03B"},
      {:content => "#{Spree.t("saldo")}", :background_color => "85F03B"}]
  end


  def item_rows
    @data = []
    @documents.each do |document|
     case document.type_config
     when "sales"
       sales_title = [{:content => "#{Spree.t("sales")}", :background_color => "F7FB71"},
         {:content => "#{document.name}", :background_color => "F7FB71"},
         {:content => "#{document.date.strftime("%d.%m.%Y")}", :background_color => "F7FB71"},
         {:content => "#{document.debt_usd}", :background_color => "F7FB71"},
         {:content => "", :background_color => "F7FB71"},
         {:content => "#{document.debt_total_usd}", :background_color => "F7FB71"}
       ]
       sales_data = document.invoice_items.map do |item|
          [ item.name,
           item.quantity,
           item.price,
           item.final_price,
           "",
           ""]
         end
         @data.push(sales_title)
         @data.push(*sales_data)

     when "return"
       return_title = [
         {:content => "#{Spree.t("return_table")}", :background_color => "F7FB71"},
         {:content => "#{document.name}", :background_color => "F7FB71"},
         {:content => "#{document.date.strftime("%d.%m.%Y")}", :background_color => "F7FB71"},
         {:content => "-#{document.income_usd}", :background_color => "F7FB71"},
         {:content => "", :background_color => "F7FB71"},
         {:content => "#{document.income_total_usd}", :background_color => "F7FB71"}
       ]
       return_data = document.invoice_items.map do |item|
          [ item.name,
           item.quantity,
           item.price,
           item.final_price,
           "",
           ""]
         end
         @data.push(return_title)
         @data.push(*return_data)
    when "income"
      income_title = [
        {:content => "#{Spree.t("pko")}", :background_color => "F7FB71"},
        {:content => "#{document.name}", :background_color => "F7FB71"},
        {:content => "#{document.date.strftime("%d.%m.%Y")}", :background_color => "F7FB71"},
        {:content => "", :background_color => "F7FB71"},
        {:content => "#{document.income_usd}", :background_color => "F7FB71"},
        {:content => "#{document.income_total_usd}", :background_color => "F7FB71"}
      ]
      @data.push(income_title)
    end
  end
     @data
  end

  def table_content
    data = [item_header]
    data += [item_header_second]
    data += item_rows
    table(data) do
      row(0).font_style = :bold
      self.header = true
      self.cell_style = { :size => 16 }
    end
  end

  def text_content
    y_position = cursor - 10

    bounding_box([0, y_position], :width => 500) do
      text "#{@mutual_settlement.date_from.strftime("%d.%m.%Y")} -- #{@mutual_settlement.date_to.strftime("%d.%m.%Y")}", size: 18, style: :bold
    end
  end

  def text_summary
    y_position = cursor - 10

    bounding_box([0, y_position], :width => 500) do
      text "#{Spree.t("summary_table")} -- #{@mutual_settlement.total_number_usd}", size: 18, style: :bold
    end
  end
end
