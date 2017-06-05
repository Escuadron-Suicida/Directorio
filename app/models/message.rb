class Message < ApplicationRecord
  belongs_to :sender, class_name: 'Business', foreign_key: :sender_id
  belongs_to :receiver, class_name: 'Business', foreign_key: :sender_id
end
