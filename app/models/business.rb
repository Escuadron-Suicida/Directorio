class Business < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products
  # has_many :messages
  has_many :productos
  has_many :business_sectors
  has_many :sectors, through: :business_sectors

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(search)
    if(search)
      where('name LIKE ?', "%#{search}")
    else
      unscoped
    end
  end

  def received_messages
    Message.where sender: self
  end

  end
