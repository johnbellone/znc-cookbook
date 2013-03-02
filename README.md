znc cookbook
============

Installs and configures ZNC, an IRC bouncer.

Usage
=====

**WARNING** - I am preparing to do a heavy refactoring on this cookbook! It will be
rewritten using current cookbook development best practices.

Requirements
============

## Chef

Tested on Chef 11 but newer and older version should work just fine. File an
[issue][issues] if this isn't the case.

## Platform

The following platforms have been tested with this cookbook, meaning that the
recipes and LWRPs run on these platforms without error:

* Ubuntu 10.04, 11.04, 12.04, 12.10
* CentOS 6

# Cookbooks

This cookbook depends on the following external cookbooks:

* [build-essential](http://community.opscode.com/cookbooks/build-essential) (Opscode)

Recipes
=======

## default

Include the default recipe in a run list, to get `znc`.  By default `znc` is installed from packages but this can be changed by using the `install_method` attribute.

## package

This recipe installs ZNC from packages.

## source

This recipe installs ZNC from source.

Attributes
==========

TODO

Testing
=======

This cookbook ships with full support for the new alpha version of Opscode's
`test-kitchen`. [Fletcher Nichol's](https://github.com/fnichol) excellent Jamie
integration test runner was
[recently merged into the test-kitchen codebase](http://lists.opscode.com/sympa/arc/chef-dev/2013-01/msg00038.html).
This merge and all new feature work are now taking place in the
[1.0 branch of test-kitchen](https://github.com/opscode/test-kitchen/tree/1.0).
Even though many community members have been dogfooding the new `test-kitchen`
codebase and it has proven quite stable, it should still be regarded as
pre-release code and YMMV.

Running integration with test-kitchen is easy. First we'll assume you have a
sane cookbook development toolchain installed which includes:

* Git
* Ruby 1.9.x
* Bundler
* VirtualBox 4.x

If you need help setting up this toolchain, take a read through the
"[System Setup](http://vialstudios.com/guide-authoring-cookbooks.html#system_setup)"
section of [Jamie Winsor's](https://github.com/reset) excellent cookbook
authoring guide.

First install all gem dependencies with Bundler:

```shell
$ bundle install --binstubs
```

Bundler will install all of the dependent RubyGems and guarantee that you have
the right versions. Now it's time to get your test on:

```shell
$ bundle exec kitchen test
```

This command will do the following across every platform/version this cookbook
supports:

* Use Vagrant to provision a platform-specific VM.
* Add a `recipe[znc]` entry to the instance's run_list.
* Converge the VM with `chef-solo`.

By default, any VM that successfully converges will automaticallly be cleaned
up. The full set of `kitchen` subcommands can be viewed by running:

```shell
$ bundle exec kitchen help
```

Development
===========

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

I <3 pull requests! Make sure your patches are well tested. Ideally create a
topic branch for every separate feature/fix you make.

License and Author
==================

Author:: [Seth Chisamore][schisamo] (<schisamo@gmail.com>) [![endorse](http://api.coderwall.com/schisamo/endorsecount.png)](http://coderwall.com/schisamo)

Copyright (c) 2011-2013, Seth Chisamore

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[schisamo]:      https://github.com/schisamo
[repo]:          https://github.com/schisamo-cookbooks/znc
[issues]:        https://github.com/schisamo-cookbooks/znc/issues
