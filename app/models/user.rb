class User < ApplicationRecord

  has_many :projects

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





  private

   def downcase_email
    self.email == email.downcase
   end

end
