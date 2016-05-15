class RemittancesController < ApplicationController
  before_action :authenticate_user!

  def index
    @remittances = Remittance.where(:user => current_user.id).all
  end

  def new
    @remittance = Remittance.new
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
