# # encoding: utf-8

# Inspec test for recipe node_app::default

# The Inspec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec_reference.html


describe port(80) do
  it { should be_listening }
end

describe package('nodejs') do 
	it { should be_installed}
end


describe package('nginx') do 
	it { should be_installed}
end

describe npm('pm2') do
  it { should be_installed }
end


