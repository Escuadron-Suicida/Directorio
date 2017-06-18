class Business < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :products
    has_many :productos
  has_many :business_sectors
  has_many :sectors, through: :business_sectors

  has_many :messages
  has_many :sent_messages, through: :messages, foreign_key: :sender_id
  has_many :received_messages, through: :messages, foreign_key: :receiver_id

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(search)
    if(search)
      where('name LIKE ?', "%#{search}")
    else
      unscoped
    end
  end

  def unseen_messages
    received_messages.where({seen: false})
  end

  def received_messages
    Message.where receiver: self
  end

  def unseen_messages?
    unseen_messages.count > 0
  end

  end
