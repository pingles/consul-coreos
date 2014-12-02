# Consul + CoreOS - hassles

This is for running a [Consul](http://consul.io/) cluster on [CoreOS](http://coreos.com) using etcd and fleet to bootstrap it.

## Why?

While CoreOS already has etcd built in and it is very similar to Consul, it is missing some of the service discovery features offered by Consul. Namely the service catalog and service health checking. These things are nice to have.

This also allows you to run [Registrator](https://github.com/progrium/registrator) on CoreOS clusters and still get the Consul-backed extra features (such as health-check support).

## Usage

1. Clone this repo: `git clone https://github.com/cap10morgan/consul-coreos.git`
1. Submit and run the included service file on your CoreOS cluster:

```
fleetctl submit consul.service
fleetctl start consul
```

## Implementation

It uses etcd and fleet to determine the size and configuration of your CoreOS cluster and spins up a Consul cluster on top of it. It runs Consul inside Docker containers (as nature intended) using [progrium's excellent Consul Docker image](https://github.com/progrium/docker-consul).

Note that as of now, it only supports running Consul on *every* CoreOS host in your cluster. This is because it looks at the output of `fleetctl list-machines` and tells Consul to expect that many hosts to connect before bootstrapping the cluster.

## TODO

1. Get rid of the persistent consul-coreos containers. They are a side-effect of how I'm currently launching the consul containers, but there's probably a more clever way to do it so that you only have consul containers but systemd is still aware of the running process, etc.
1. Switch to adding client nodes (as opposed to more server nodes) when the cluster is above a certain size. For now this has been tested on a 3-node cluster and should work on clusters close to that size.

## License

BSD
