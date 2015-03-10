# Consul on CoreOS Docker

A Docker container for running a [Consul](http://consul.io/) cluster on [CoreOS](http://coreos.com). Uses Consul 0.5 and [Atlas](https://atlas.hashicorp.com) for bootstrapping

## Usage

```
fleetctl submit consul@.service
fleetctl start consul@1
```
