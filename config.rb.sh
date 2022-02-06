sudo cat<<EOF >>  /srv/gitlab/config/gitlab.rb
# My Domain Parameters
registry_external_url 'https://registry.XXXXXXXXXXXX.io'
external_url 'https://gitlab.XXXXXXXXXXX.io'
letsencrypt['enable'] = true
EOF
