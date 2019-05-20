require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    category = Category.create! name: 'Apparel'
    product = category.products.create!({
      name: 'Hipster Hat',
      description: 'It is great!',
      image: 'apparel3.jpg',
      quantity: 4,
      price_cents: 23
    })
    it 'should create a new product successfully' do
      expect(product).to be_valid
    end
    it 'should have a name' do
      product.name = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end
    it 'should have a price' do
      product.price_cents = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end
    it 'should have a quantity' do
      product.quantity = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
    it 'should have a category' do
      product.category_id = nil
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end
  end
end
