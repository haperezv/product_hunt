# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  visible     :boolean          default(TRUE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  slug        :string
#
class Product < ApplicationRecord

    extend FriendlyId
    friendly_id :name, use: :slugged

    validates :name, presence: { message: "El nombre es rerquerido" }
    validates :description, presence: { message: "La descripción es rerquerida" }

    validates :name, length: { maximum: 200, minimum: 2,  message: "El nombre debe tener 2 caracteres" }

    has_one_attached :image, :dependent => :destroy

    has_many :product_categories

end
