require 'serverspec'

describe cron do
  it { should have_entry '*/5 * * * * wget -q -O /etc/fastd/fastd-blacklist.json https://raw.githubusercontent.com/ffruhr/fastdbl/master/fastd-blacklist.json' }
end

describe user('fritz') do
  it { should exist }
  it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAAgQCfO2TgNUMcY9K8N9SsAU/LfVtlloO50n6NRxDER8dCi+t1ydalTbNdEj52cIjqvIEn458cCxdCwsNYeWqSVggX7vT7a+DgYZlJcRteHcb0lPYZplPuiZe3AUE9rHH48W4xEopv7J8Wz6hLng6Gb0TQx9HeVybQ5dn6CGyt8sOCKQ== Fritz Brinkhoffs' }
end

describe port(67) do
  it { should be_listening.with('udp') }
end