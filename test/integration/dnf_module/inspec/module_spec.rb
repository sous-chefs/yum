describe command('node --version') do
  its('stdout') { should match /v12/ }
end

describe command('ruby --version') do
  its('stdout') { should match /ruby 2.7/ }
end

describe command('dnf module list --disabled mysql') do
  its('stdout') { should match /mysql.+\[x\]/ }
end
