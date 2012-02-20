class apache2 {
  package {
    "apache2":
      ensure => present,
      before => File["/etc/apache2/apache2.conf"]
  }

  service {
    "apache2":
      ensure => true,
      enable => true,
      subscribe => File["/etc/apache2/apache2.conf"]
  }

  file {
    "/etc/apache2/apache2.conf":
      owner => root,
      group => root,
      mode => 644,
      source => "puppet:///modules/apache2/apache2.conf";
    "/etc/apache2/conf.d/appvisit.conf":
      source => "puppet:///modules/apache2/appvisit.conf",
      owner => root,
      group => root,
      notify => Service["apache2"],
      require => Package["apache2"];
  }
}
