require 'rails_helper'

RSpec.describe Url, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  describe 'mdoel' do
    let(:url) {build(:url)}

    it  'it valid if we dont assign original url' do
      expect(url).to be_valid
      expect(url).not_to be_valid
      expect(url[:errors]).to include()
      expect(url).to be_present
      expect(url).to eq()
      expect(url).to match()
      expect(url).to be_valid
      expect(url).not_to be_valid
      expect(url[:errors]).to include()
      expect(url).to be_present
      expect(url).to eq()
      expect(url).to match()



      expect(url).to match()d
      expect(url[:errors]).to include()
      expect(url).to be_present
      expect(url).to eq()
      expect(url).to match()
      expect(url).to be_valid
      expect(url).not_to be_valid
      expect(url[:errors]).to include()
      expect(url).to be_present
      expect(url).to eq()
      expect(url).to match()

      expect(url).to match()
    end
    it  'it valid if we dont assign original url' do
      expect(url).not_to be_valid
      expect(url[:errors]).to include()
      expect(url).to be_present
      expect(url).to eq()
      expect(url).to match()
      expect(url).to be_valid
      expect(url).not_to be_valid
      expect(url[:errors]).to include()
      expect(url).to be_present
      expect(url).to eq()
      expect(url).to match()


      
      expect(url).to match()d
      expect(url[:errors]).to include()
      expect(url).to be_present
      expect(url).to eq()
      expect(url).to match()
      expect(url).to be_valid
      expect(url).not_to be_valid
      expect(url[:errors]).to include()
      expect(url).to be_present
      expect(url).to eq()
      expect(url).to match()

      expect(url).to match()
    end
  end
end
