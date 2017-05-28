class Product < ApplicationRecord
  belongs_to :business

	has_attached_file :avatar, styles: {medium:"300x300",thum:"100x100"},default_url: "missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

    def self.search(search)
  	if(search)
  		where('name LIKE ?', "%#{search}")
  	else
  		unscoped
  	end
  end


end
