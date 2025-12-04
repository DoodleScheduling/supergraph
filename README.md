# Rover

Automated docker builds for apollo rover. The package includes the `supergraph` plugin by default.

## License

Running `rover supergraph` requires to accept the license [here](https://www.apollographql.com/trust/licensing).
The docker image on purpse does not accept the license out of the box due compliance. You will need to accept the license at runtime using the env `APOLLO_ELV2_LICENSE=accept`
or build your own image on top of this one.
