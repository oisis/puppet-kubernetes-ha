# sytem_profile.rb
Facter.add("system_profile") do
  if File.exists?('/etc/sysconfig/systemProfile')
    setcode do
      artifacts = File.readlines('/etc/sysconfig/systemProfile').map {|l| l.chomp }.sort.join(' ')
    end
  else
    nil
  end
end
