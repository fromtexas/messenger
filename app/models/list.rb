class List < ApplicationRecord
	belongs_to :user, foreign_key: :user_id, class_name: User
	belongs_to :contact, foreign_key: :contact_id, class_name: User
	  validates :contact_id, uniqueness: { scope: :user_id }


 scope :between, -> (user_id, contact_id) do
    where(user_id: user_id, contact_id: contact_id).or(
      where(user_id: contact_id, contact_id: user_id)
    )
  end
 
  def self.getList(user_id, contact_id)
    list = between(user_id, contact_id).first
    return list if list.present?
 
    create(user_id: user_id, contact_id: contact_id)
  end

  
 
 
end
