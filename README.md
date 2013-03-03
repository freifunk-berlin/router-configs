# Usage

To create a new router config from the template use:

```sh
./bin/create foo
```

Backup config from router:

```sh
./bin/pull foo 192.168.1.1
git status
git add foo/*
git commit -m "add config for router foo"
```
