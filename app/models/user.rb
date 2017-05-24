class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :messages
has_many :conversations, foreign_key: :sender_id

def self.terms_for(term)
	
current = User.where(["lower(email) LIKE ?","#{term.downcase}_%"]) if term.present?
current.all.map { |item| [item.id,item.email] }
	
end
end
