echo "registry_external_url 'https://registry.XXXXXXXXXXXX.io'" | sudo teaa -a /srv/gitlab/config/gitlab.rb
echo "external_url 'https://gitlab.XXXXXXXXXXX.io'" | sudo teaa -a /srv/gitlab/config/gitlab.rb
echo "letsencrypt['enable'] = true'" | sudo teaa -a /srv/gitlab/config/gitlab.rb