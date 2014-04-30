require 'spec_helper'

describe Dogecoin do
  before :each do
    FakeWeb.register_uri(:post, "http://user:pass@localhost:22555", :response => fixture('getbalance'))
  end
  
  it "as a function" do
    cli = Dogecoin($user, $pass)
    cli.balance.should == 0.001
  end
  
  it "DSL, included" do
    class << self
      include Dogecoin
    end
    
    username $user
    password $pass
    
    balance.should == 0.001
  end
  
  it "DSL, extended" do
    class << self
      include Dogecoin
      
      username $user
      password $pass
      
      balance.should == 0.001
    end
  end
end
