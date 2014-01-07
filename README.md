# Confluence

Puppet module for [Atlassian Confluence](https://www.atlassian.com/software/confluence).

Installs a basic Confluence standalone installation in `/opt` and starts it.

Note: Currently this module is not production ready.

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

For testing, run `rake test`.

## License

See [LICENSE](LICENSE) file.
