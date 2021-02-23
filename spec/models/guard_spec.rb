require 'rails_helper'

RSpec.describe Guard, type: :model do
  before do
    @guard = FactoryBot.build(:guard)
  end

  describe '警備員新規登録' do
    context '新規登録できるとき' do
      it 'companyからqualificationまでの８項目が全て存在すれば登録できる' do
        expect(@guard).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'companyが空では登録できない' do
        @guard.company = ''
        @guard.valid?
        expect(@guard.errors.full_messages).to include("Company can't be blank")
      end
      it 'imageが空では登録できない' do
        @guard.image = nil
        @guard.valid?
        expect(@guard.errors.full_messages).to include("Image can't be blank")
      end
      it 'guard_nameが空では登録できない' do
        @guard.guard_name = ''
        @guard.valid?
        expect(@guard.errors.full_messages).to include("Guard name can't be blank")
      end
      it 'name_kanaが空では登録できない' do
        @guard.name_kana = ''
        @guard.valid?
        expect(@guard.errors.full_messages).to include("Name kana can't be blank")
      end
      it 'genderが空では登録できない' do
        @guard.gender = ''
        @guard.valid?
        expect(@guard.errors.full_messages).to include("Gender can't be blank")
      end
      it 'ageが空では登録できない' do
        @guard.age = ''
        @guard.valid?
        expect(@guard.errors.full_messages).to include("Age can't be blank")
      end
      it 'experienceが空では登録できない' do
        @guard.experience = ''
        @guard.valid?
        expect(@guard.errors.full_messages).to include("Experience can't be blank")
      end
      it 'qualificationが空では登録できない' do
        @guard.qualification = ''
        @guard.valid?
        expect(@guard.errors.full_messages).to include("Qualification can't be blank")
      end
    end
  end
end
