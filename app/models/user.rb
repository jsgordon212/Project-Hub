class User < ApplicationRecord
  include Obfuscate

  has_many :projects
  has_many :components

  validates :username, presence: true, length: {maximum: 20}
  validates :password, presence: true, length: {minimum: 6}
  validates :email, presence: true,
                    length: {maximum: 255},
                    format: {with: /\A[\w+\-.]+@[a-z\d\-.]+(\.[a-z\d\-]+)+\z/i},
                    uniqueness: {case_sensitive: false}

  before_save :downcase_email

  has_secure_password

  def project_page_count
    if self.projects.length < 6
      return 1
    else
      return (self.projects.length/5) + 1
    end
  end

  def to_param
    encrypt id
  end


  private

   def downcase_email
    self.email == email.downcase
   end

end
