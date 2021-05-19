class DashboardController < ApplicationController
  def index
    @sales = Sale.all

    @sales_group_by_month= Sale.group_by_month(:date, last:12).sum(:price)
    @sales_group_by_month_quantity = Sale.group_by_month(:date, last:12).sum(:quantity)
    @average_sales_by_month = Sale.group_by_month(:date, last:12).average(:quantity)

    #Graficos de torta 
    #Ventas
    
    @sales_grouped_by_origin = Sale.where(date: 1.year.ago..Date.today).group(:origin).count
    @sales_grouped_by_origin6 = Sale.where(date: 6.months.ago..Date.today).group(:origin).count
    @sales_grouped_by_origin3 = Sale.where(date: 3.months.ago..Date.today).group(:origin).count
    @sales_grouped_by_origin1 = Sale.where(date: 1.month.ago..Date.today).group(:origin).count

    #Cantidad 

    @sales_grouped_by_name = Sale.where(date: 1.year.ago..Date.today).group(:name).count
    @sales_grouped_by_name6 = Sale.where(date: 6.months.ago..Date.today).group(:name).count
    @sales_grouped_by_name3 = Sale.where(date: 3.months.ago..Date.today).group(:name).count
    @sales_grouped_by_name1 = Sale.where(date: 1.month.ago..Date.today).group(:name).count
  end
end
