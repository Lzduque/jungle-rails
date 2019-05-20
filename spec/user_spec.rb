require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject do
      user = User.new(
        firstname: 'John',
        lastname: 'Snow',
        email: 'jsnow@got.com',
        password: 'winter',
        password_confirmation: 'winter'
      )
    end
    it 'should be created successfully when all fields are present' do
      expect(subject).to be_valid
    end
    it 'should have a first name' do
      subject.firstname = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Firstname can't be blank")
    end
    it 'should have a last name' do
      subject.lastname = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Lastname can't be blank")
    end
    it 'should have a email' do
      subject.email = nil
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email can't be blank")
    end
    it 'should have a password field' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it 'should have a password confirmation field' do
      subject.password = 'winter'
      subject.password_confirmation = nil
      expect(subject).to_not be_valid
    end
    it 'password and password confirmation fields should match' do
      subject.password_confirmation = 'snow'
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'emails should be unique' do
      user1 = User.create!({
        firstname: 'Dany',
        lastname: 'Targaryen',
        email: 'jsnow@got.com',
        password: 'throne',
        password_confirmation: 'throne'
      })
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email has already been taken")
    end
    it 'emails should be case insensitive' do
      user1 = User.create!({
        firstname: 'Dany',
        lastname: 'Targaryen',
        email: 'JSnow@got.com',
        password: 'throne',
        password_confirmation: 'throne'
      })
      expect(subject).to_not be_valid
      expect(subject.errors.full_messages).to include("Email has already been taken")
    end
  end
end
