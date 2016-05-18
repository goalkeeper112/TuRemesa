require 'rest-client'

class RemittancesController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user.role["name"] === 'admin'
      @remittances = Remittance.all
    else
      @remittances_transferencia = Remittance.where(:user => current_user.id, :method_pay => 'transferencia').all
      @remittances_retiros = Remittance.where(:user => current_user.id, :method_pay => 'retiro').all
      @remittances_entrega = Remittance.where(:user => current_user.id, :method_pay => 'entrega').all
    end
  end

  def new
    @remittance = Remittance.new

    response_vef = RestClient.get 'http://api.bitcoinvenezuela.com/DolarToday.php?json=yes'
    response_vef = JSON.parse response_vef

    response_ars = RestClient.get 'http://ws.geeklab.com.ar/dolar/get-dolar-json.php'
    response_ars = JSON.parse response_ars
    puts response_ars
    @rate_vef = response_vef["USD"]["transferencia"] + response_vef["USD"]["efectivo_cucuta"]
    @rate_vef = @rate_vef.fdiv(2)

    @rate_ars = response_ars["libre"].to_i + response_ars["blue"].to_i
    @rate_ars = @rate_ars.fdiv(2)
  end

  def create
    @remittance = Remittance.new(filtered_params)

    @remittance.save

    redirect_to :action => :index
  end

  def destroy
    @remittance = Remittance.find(params[:id])
    @remittance.destroy

    redirect_to :action => :index
  end

  private
  def filtered_params
   params.require(:remittance).permit(:user_id, :first_name, :last_name, :country, :from, :to, :amount_send, :amount_receive, :bank, :type_account, :number_account, :id_card)
  end
end
