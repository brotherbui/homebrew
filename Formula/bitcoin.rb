require "fileutils"
class Bitcoin < Formula
  desc "Decentralized, peer to peer payment network"
  homepage "https://bitcoincore.org/"
  url "https://bitcoincore.org/bin/bitcoin-core-28.0/bitcoin-28.0.tar.gz"
  sha256 "700ae2d1e204602eb07f2779a6e6669893bc96c0dca290593f80ff8e102ff37f"
  license all_of: [
    "MIT",
    "BSD-3-Clause", # src/crc32c, src/leveldb
    "BSL-1.0", # src/tinyformat.h
    "Sleepycat", # resource("bdb")
  ]
  head "https://github.com/bitcoin/bitcoin.git", branch: "master"

  livecheck do
    url "https://bitcoincore.org/en/download/"
    regex(/latest version.*?v?(\d+(?:\.\d+)+)/i)
  end


  bottle do
    sha256 cellar: :any,                 arm64_sequoia: "9827fe39470644c9e18c2e29a9cc50517d755ab23600dfc15fc73a4c436090df"
    sha256 cellar: :any,                 arm64_sonoma:  "dadd606914dc46493f9c71f3b12975186f91d15cc139cb3f9630baa4f9207420"
    sha256 cellar: :any,                 arm64_ventura: "c21b31a816054f9bb708a30d19b7168c4287a1262723d194925ec6550c7152bd"
    sha256 cellar: :any,                 sonoma:        "0e2895408874d922a18a81df8bbaa65aa67215c8445d6ae7ce856613f18ffd1d"
    sha256 cellar: :any,                 ventura:       "68e8ddb21ef1fe0a67e2e72f4b5b5f0092304e501deb2aa7ad98ba9850ea5774"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "082c20a351f23b99cb778ae5b643d3ba7d02feeca0cd9adc8474e350fd9c649a"
  end

  service do
    run opt_bin/"bitcoind"
  end

  def config_dir
    @config_dir ||= if OS.mac?
      "#{ENV["HOME"]}/Library/Application Support/Bitcoin"
    elsif OS.linux?
      "#{ENV["HOME"]}/.bitcoin"
    end
  end

  def config_file
    @config_file ||= "#{config_dir}/bitcoin.conf"
  end

  def generate_rpc_auth
  begin
    username = "user_#{Random.rand(100000)}"
    rpcauth_script = "#{Formula["bitcoin"].opt_share}/bitcoin/rpcauth/rpcauth.py"

    # Create Bitcoin directory if it doesn't exist
    bitcoin_dir = File.expand_path("~/Library/Application Support/Bitcoin")
    FileUtils.mkdir_p(bitcoin_dir) unless Dir.exist?(bitcoin_dir)

    # Set proper permissions
    conf_file = File.join(bitcoin_dir, "bitcoin.conf")

    # Try to create the file if it doesn't exist
    unless File.exist?(conf_file)
      begin
        FileUtils.touch(conf_file)
        FileUtils.chmod(0600, conf_file)  # Set permissions to user read/write only
      rescue Errno::EACCES
        opoo "Unable to create #{conf_file}"
        opoo "You may need to create it manually"
        return nil
      end
    end

    ohai "Debug: Checking Python installation..."
    if which("python3")
      python_cmd = "python3"
      ohai "Debug: Using python3"
    elsif which("python")
      python_cmd = "python"
      ohai "Debug: Using python"
    else
      raise "Python is required but not found"
    end

    ohai "Debug: RPC auth script path: #{rpcauth_script}"
    unless File.exist?(rpcauth_script)
      raise "rpcauth script not found at #{rpcauth_script}"
    end
    ohai "Debug: RPC auth script exists"

    # Execute the script with just the username
    output = `#{python_cmd} #{rpcauth_script} #{username}`

    ohai "Debug: Script output: #{output}"

    # Get the lines we need
    lines = output.split("\n")
    rpcauth_line = lines[1]  # The rpcauth line should be the second line
    password = lines[3]      # The password should be the fourth line

    {
      rpcauth: rpcauth_line,
      password: password,
      username: username
    }
  rescue StandardError => e
    ohai "Debug: Error in generate_rpc_auth: #{e.message}"
    ohai "Debug: Backtrace: #{e.backtrace.join("\n")}"
    nil
  end
end


  def write_config(auth_info)
    File.open(config_file, "w") do |f|
      f.puts "# Bitcoin configuration file"
      f.puts "# Generated by Homebrew on #{Time.now}"
      f.puts "# Platform: #{OS.mac? ? "macOS" : "Linux"}"
      f.puts
      f.puts "# Network"
      f.puts "server=1"
      f.puts "txindex=1"
      f.puts "listen=1"
      f.puts "dbcache=6144"
      f.puts "rpcport=8332"
      f.puts "port=8333"
      f.puts
      f.puts "# RPC configuration"
      f.puts auth_info[:rpcauth]

      # Platform specific settings
      if OS.mac?
        f.puts
        f.puts "# macOS specific settings"
        f.puts "datadir=~/Library/Application Support/Bitcoin"
      elsif OS.linux?
        f.puts
        f.puts "# Linux specific settings"
        f.puts "datadir=~/.bitcoin"
      end
    end
  end

  def post_install
    begin
      ohai "Debug: Starting post_install"
      mkdir_p config_dir unless Dir.exist?(config_dir)
      ohai "Debug: Config directory: #{config_dir}"

      unless File.exist?(config_file)
        ohai "Generating RPC authentication credentials..."
        auth_info = generate_rpc_auth
        if auth_info
          ohai "Creating configuration file..."
          write_config(auth_info)
          FileUtils.chmod 0600, config_file

          password_file = "#{config_dir}/rpcpassword.txt"
          File.write(password_file, <<~EOS)
            Bitcoin RPC Credentials
            ----------------------
            Username: #{auth_info[:username]}
            Password: #{auth_info[:password]}

            This file should be kept secure and deleted after noting down the credentials.
          EOS
          FileUtils.chmod 0600, password_file
          ohai "Configuration completed successfully"
        else
          raise "Failed to generate RPC authentication"
        end
      end
    rescue StandardError => e
      opoo "Failed to create configuration file: #{e.message}"
      opoo "You may need to create it manually at: #{config_file}"
    end
  end

  def caveats
    return unless File.exist?(config_file)

    <<~EOS
      Configuration file created at:
      #{config_file}

      RPC credentials have been saved to:
      #{config_dir}/rpcpassword.txt

      IMPORTANT: Please save these credentials securely and delete
      the rpcpassword.txt file afterward.

      File permissions have been set to 600 for security.
    EOS
  end

  test do
    assert_predicate config_file, "exist?"
    system bin/"test_bitcoin"

    # Test that we're using the right version of `berkeley-db`.
    port = free_port
    bitcoind = spawn bin/"bitcoind", "-regtest", "-rpcport=#{port}", "-listen=0", "-datadir=#{testpath}",
                                     "-deprecatedrpc=create_bdb"
    sleep 15
    # This command will fail if we have too new a version.
    system bin/"bitcoin-cli", "-regtest", "-datadir=#{testpath}", "-rpcport=#{port}",
                              "createwallet", "test-wallet", "false", "false", "", "false", "false"
  ensure
    Process.kill "TERM", bitcoind
  end
end
