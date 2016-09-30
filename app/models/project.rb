class Project < ApplicationRecord

  include Obfuscate

  belongs_to  :creator, { class_name: 'User', foreign_key: 'user_id' }
  has_many    :contributers, { class_name: 'User', foreign_key: 'user_id' }
  has_many    :components
  has_many    :commits


  validates :title, presence: true

  def to_param
    encrypt id
  end

end
