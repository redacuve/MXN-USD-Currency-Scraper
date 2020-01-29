require_relative '../config/config.rb'

describe Config do
  describe 'path' do
    it 'Path must be a string' do
      expect(Config.path.class).to eql(String)
    end
  end

  describe 'sites' do
    it 'sites needs to be a Hash' do
      expect(Config.sites.class).to eql(Hash)
    end
  end

  describe 'codes' do
    it 'codes needs to be a Hash' do
      expect(Config.codes.class).to eql(Hash)
    end
  end

  describe 'names' do
    it 'names needs to be an array' do
      expect(Config.names.class).to eql(Array)
    end
  end
end
