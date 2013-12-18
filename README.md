# Confluence

[![Build Status](https://travis-ci.org/antonlindstrom/puppet-confluence.png?branch=master)](https://travis-ci.org/antonlindstrom/puppet-confluence)

Puppet module for [Atlassian Confluence](https://www.atlassian.com/software/confluence).

Installs a basic Confluence standalone installation in `/opt` and starts it.

## Example usage

Include with default parameters:

    include confluence

Set max, min and permgen memory sizes:

    class { 'confluence':
      minimum_memory => '512m',
      maximum_memory => '512m',
      permgen_size   => '2048m',
    }

Set JVM options for confluence:

    class { 'confluence':
      jvm_options => '-Djava.net.preferIPv4Stack=true',
    }

## License

See [LICENSE](LICENSE) file.
