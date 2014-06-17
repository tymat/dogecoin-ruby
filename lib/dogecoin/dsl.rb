module Dogecoin::DSL
  def dogecoin
    if self.class.respond_to?(:dogecoin)
      @client ||= Dogecoin::Client.new(self.class.dogecoin.user, self.class.dogecoin.pass, self.class.dogecoin.options)
    else
      @client ||= Dogecoin::Client.new(nil, nil)
    end
  end

  def username=(value)
    dogecoin.user = value
  end

  def password=(value)
    dogecoin.pass = value
  end

  def host=(value)
    dogecoin.host = value
  end

  def port=(value)
    dogecoin.port = value
  end

  def ssl=(value)
    dogecoin.ssl = value
  end

  def username(value = nil)
    value ? dogecoin.user = value : dogecoin.user
  end

  def password(value = nil)
    value ? dogecoin.pass = value : dogecoin.pass
  end

  def host(value = nil)
    value ? dogecoin.host = value : dogecoin.host
  end

  def port(value = nil)
    value ? dogecoin.port = value : dogecoin.port
  end

  def ssl(value = nil)
    value.nil? ? dogecoin.ssl : dogecoin.ssl = value
  end

  def ssl?
    dogecoin.ssl?
  end


  # Safely copies wallet.dat to destination, which can be a directory or a path with filename.
  def backupwallet(destination)
    dogecoin.backupwallet destination
  end

  # Returns the account associated with the given address.
  def getaccount(dogecoinaddress)
    dogecoin.getaccount dogecoinaddress
  end

  # Returns the current dogecoin address for receiving payments to this account.
  def getaccountaddress(account)
    dogecoin.getaccountaddress account
  end

  #	Returns the list of addresses for the given account.
  def getaddressesbyaccount(account)
    dogecoin.getaddressesbyaccount account
  end

  # If +account+ is not specified, returns the server's total available balance.
  # If +account+ is specified, returns the balance in the account.
  def getbalance(account = nil, minconf = 1)
    dogecoin.getbalance account, minconf
  end

  # Dumps the block existing at specified height.
  # Note: this is not available in the official release
  def getblockbycount(height)
    dogecoin.getblockbycount height
  end

  # Dumps the block existing with specified hash.
  def getblock(hash)
    dogecoin.getblock hash
  end

  # Returns the number of blocks in the longest block chain.
  def getblockcount
    dogecoin.getblockcount
  end

  # Returns the block number of the latest block in the longest block chain.
  def getblocknumber
    dogecoin.getblocknumber
  end

  # Returns the number of connections to other nodes.
  def getconnectioncount
    dogecoin.getconnectioncount
  end

  # Returns the proof-of-work difficulty as a multiple of the minimum difficulty.
  def getdifficulty
    dogecoin.getdifficulty
  end

  # Returns true or false whether dogecoind is currently generating hashes
  def getgenerate
    dogecoin.getgenerate
  end

  # Returns a recent hashes per second performance measurement while generating.
  def gethashespersec
    dogecoin.gethashespersec
  end

  # Returns an object containing various state info.
  def getinfo
    dogecoin.getinfo
  end

  # Returns an object containing various mining info.
  def getmininginfo
    dogecoin.getmininginfo
  end

  # Returns a new dogecoin address for receiving payments. If +account+ is specified (recommended),
  # it is added to the address book so payments received with the address will be credited to +account+.
  def getnewaddress(account = nil)
    dogecoin.getnewaddress account
  end

  # Returns the total amount received by addresses with +account+ in transactions
  # with at least +minconf+ confirmations.
  def getreceivedbyaccount(account, minconf = 1)
    dogecoin.getreceivedbyaccount account, minconf
  end

  # Returns the total amount received by +dogecoinaddress+ in transactions with at least +minconf+ confirmations.
  def getreceivedbyaddress(dogecoinaddress, minconf = 1)
    dogecoin.getreceivedbyaddress dogecoinaddress, minconf
  end

  # Get detailed information about +txid+
  def gettransaction(txid)
    dogecoin.gettransaction txid
  end

  # If +data+ is not specified, returns formatted hash data to work on:
  #
  #  :midstate => precomputed hash state after hashing the first half of the data
  #  :data     => block data
  #  :hash1    => formatted hash buffer for second hash
  #  :target   => little endian hash target
  #
  # If +data+ is specified, tries to solve the block and returns true if it was successful.
  def getwork(data = nil)
    dogecoin.getwork data
  end

  # List commands, or get help for a command.
  def help(command = nil)
    dogecoin.help command
  end

  # Returns Object that has account names as keys, account balances as values.
  def listaccounts(minconf = 1)
    dogecoin.listaccounts minconf
  end

  # Returns an array of objects containing:
  #
  #   :account       => the account of the receiving addresses
  #   :amount        => total amount received by addresses with this account
  #   :confirmations => number of confirmations of the most recent transaction included
  #
  def listreceivedbyaccount(minconf = 1, includeempty = false)
    dogecoin.listreceivedbyaccount minconf, includeempty
  end

  # Returns an array of objects containing:
  #
  #   :address       => receiving address
  #   :account       => the account of the receiving address
  #   :amount        => total amount received by the address
  #   :confirmations => number of confirmations of the most recent transaction included
  #
  # To get a list of accounts on the system, execute dogecoind listreceivedbyaddress 0 true
  def listreceivedbyaddress(minconf = 1, includeempty = false)
    dogecoin.listreceivedbyaddress minconf, includeempty
  end

  # Returns up to +count+ most recent transactions for account +account+.
  def listtransactions(account, count = 10)
    dogecoin.listtransactions account, count
  end

  # Move from one account in your wallet to another.
  def move(fromaccount, toaccount, amount, minconf = 1, comment = nil)
    dogecoin.move fromaccount, toaccount, amount, minconf, comment
  end

  # +amount+ is a real and is rounded to 8 decimal places. Returns the transaction ID if successful.
  def sendfrom(fromaccount, todogecoinaddress, amount, minconf = 1, comment = nil, comment_to = nil)
    dogecoin.sendfrom fromaccount, todogecoinaddress, amount, minconf, comment, comment_to
  end

  # +amount+ is a real and is rounded to 8 decimal places
  def sendtoaddress(dogecoinaddress, amount, comment = nil, comment_to = nil)
    dogecoin.sendtoaddress dogecoinaddress, amount, comment, comment_to
  end

  #
  def settxfee(amount = 0.0001)
    dogecoin.settxfee(amount)
  end

  # Sets the account associated with the given address.
  def setaccount(dogecoinaddress, account)
    dogecoin.setaccount dogecoinaddress, account
  end

  # +generate+ is true or false to turn generation on or off.
  # Generation is limited to +genproclimit+ processors, -1 is unlimited.
  def setgenerate(generate, genproclimit = -1)
    dogecoin.setgenerate generate, genproclimit
  end

  # Stop dogecoin server.
  def stop
    dogecoin.stop
  end

  # Return information about +dogecoinaddress+.
  def validateaddress(dogecoinaddress)
    dogecoin.validateaddress
  end

  alias account getaccount
  alias account_address getaccountaddress
  alias addresses_by_account getaddressesbyaccount
  alias balance getbalance
  alias block_by_count getblockbycount
  alias block_count getblockcount
  alias block_number getblocknumber
  alias connection_count getconnectioncount
  alias difficulty getdifficulty
  alias generate? getgenerate
  alias hashes_per_sec gethashespersec
  alias info getinfo
  alias mininginfo getmininginfo
  alias new_address getnewaddress
  alias received_by_account getreceivedbyaccount
  alias received_by_address getreceivedbyaddress
  alias transaction gettransaction
  alias work getwork
  alias get_work getwork
  alias accounts listaccounts
  alias list_received_by_account listreceivedbyaccount
  alias list_received_by_address listreceivedbyaddress
  alias transactions listtransactions
  alias list_transactions listtransactions
  alias send_from sendfrom
  alias send_to_address sendtoaddress
  alias account= setaccount
  alias set_account setaccount
  alias generate= setgenerate
  alias set_generate setgenerate
  alias validate_address validateaddress
end
