maintainer       'Seth Chisamore'
maintainer_email "schisamo@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures ZNC IRC bouncer"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'ark'

supports 'centos', '>= 6.0'
supports 'redhat', '>= 6.0'
supports 'ubuntu', '>= 10.04'
