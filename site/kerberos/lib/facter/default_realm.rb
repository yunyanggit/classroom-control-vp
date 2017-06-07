require 'augeas'
Facter.add("default_realm") do
  setcode do
    Augeas:::open do |aug|
      aug.get('/files/etc/krb5.conf/lib/defaults/default_realm')
    end
  end
end
