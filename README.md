# SushiChain Blockchain Explorer

SushiChain Explorer is an open source utility to browse activity on the Blockchain.

## Development

### Build the mint webapp

    cd src/explorer/web/static
    mint build
    cd ./../../../..

### Run the explorer

    DEBUG=1 crystal run src/explorer.cr -- -n http://testnet.sushichain.io:3000

### Compile the binary

    shards build --production

Start the compiled web application (static files are in binary)

    ./bin/explorer -n http://testnet.sushichain.io:3000 

### RethinkDB docker doc

[Link to RethinkDB docker documentation](https://docs.docker.com/samples/library/rethinkdb/)

    docker run -p 8080:8080 -p 28015:28015 --name rethinkdb -v "$PWD:/data" -d rethinkdb

    # Connecting to the web admin interface on the same host

    xdg-open "http://$(docker inspect --format \
      '{{ .NetworkSettings.IPAddress }}' rethinkdb):8080"

    # Connecting to the web admin interface on a remote / virtual host via SSH
    # Where remote is an alias for the remote user@hostname:

    # start port forwarding
    ssh -fNTL 8080:$(docker inspect --format \
      '{{ .NetworkSettings.IPAddress }}' rethinkdb):8080 localhost

    ssh -fNTL 28015:$(docker inspect --format \
      '{{ .NetworkSettings.IPAddress }}' rethinkdb):28015 localhost

    # open interface in browser
    xdg-open http://localhost:8080

    # stop port forwarding
    kill $(lsof -t -i @localhost:8080 -sTCP:listen)
    kill $(lsof -t -i @localhost:28015 -sTCP:listen)

## Contributing

1. Fork it (<https://github.com/your-github-user/explorer/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

* [Christian Kakesa](https://github.com/your-github-user) - creator and maintainer
