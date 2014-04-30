module Dogecoin
  autoload :Client, 'dogecoin/client'
  autoload :API,    'dogecoin/api'
  autoload :Request,'dogecoin/request'
  autoload :RPC,    'dogecoin/rpc'
  autoload :Errors, 'dogecoin/errors'
  autoload :Version,'dogecoin/version'
  autoload :VERSION,'dogecoin/version'
  autoload :DSL,    'dogecoin/dsl'
  
  def self.included(base)
    base.send(:include, Dogecoin::DSL)
    base.send(:extend,  Dogecoin::DSL)
  end
end

def Dogecoin(user, pass, options = {})
  ::Dogecoin::Client.new(user, pass, options)
end
