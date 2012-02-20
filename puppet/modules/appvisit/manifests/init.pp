class appvisit {
  file {
    ["/var/appvisit/", "/var/appvisit/shared/","/var/appvisit/shared/config/"]:
      ensure => directory,
      owner => vagrant,
      group => vagrant,
      mode => 775
  }
  file {
    "/var/appvisit/shared/config/database.yml":
      ensure => present,
      owner => vagrant,
      group => vagrant,
      mode => 600,
      source => "puppet:///modules/appvisit/database.yml"
  }
  package {
    "bundler":
      provider => gem
  }
}
