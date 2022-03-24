require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Mexdups do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ mexdups }).should.be.instance_of Command::Mexdups
      end
    end
  end
end

