class Project < ApplicationRecord
  include Obfuscate

  belongs_to :user
  validates :title, presence: true

  def to_param
    encrypt id
  end



end
