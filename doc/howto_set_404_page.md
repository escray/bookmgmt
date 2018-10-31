```
$bundle exec rake assets:precompile
$bundle exec rake db:migrate RAILS_ENV=production
```

devise.rb

```
config.secret_key = '688441eeefc000da5b2d392340b2a9d61059c807963b2b82ffd1390af90416a56f6ba7ca57d29c0517b2d2fd4b3a997322d7b33bcfb44c5a51b9c8386fcbcd37'
```

config/environments/production.rb

```
config.public_file_server.enabled = true
```

public/404.html

```
$SECRET_KEY_BASE=`bundle exec rake secret` rails s -e production
```
