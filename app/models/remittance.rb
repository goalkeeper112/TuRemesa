class Remittance < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  before_create :set_default_status

  private
  def set_default_status
    self.status ||= "En Proceso"
  end
end
