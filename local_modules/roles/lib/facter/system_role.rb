# sytem_role.rb
Facter.add("system_role") do
  if File.exists?('/etc/sysconfig/systemRole')
    setcode do
      artifacts = File.read('/etc/sysconfig/systemRole').chomp
    end
  else
    nil
  end
end
