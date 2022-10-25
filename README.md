# Digital Ocean Droplet + WordPress/MariaDB/Nginx

> Together at last

## Usage

1. Generate and add your Digital Ocean and Cloudflare API tokens
1. Create `.env` files based on the `.env.example` files and update values

Then, deploy:

```shell
cd deploy
task tf-init tf-plan tf-apply
```

Wait until done, and then SSH into your server based on the outputted IP value from Terraform.

```shell
ssh <username>@<droplet_ip_address>
```

You'll be disconnected when the server finishes running the cloud-init scripts, but that's no reason not to start poking around to see if it all worked.

```shell
## check cloud-init logs
sudo cat /var/log/cloud-init-output.log

## WAIT UNTIL THE DROPLET REBOOTS BEFORE CONTINUING

## Tear it all down

```shell
task tf-destroy
```

## License

The MIT License (MIT)

Copyright (c) 2022 Dane Petersen
