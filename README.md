<h1 align="center">Pocket F.I.L.E.S.</h1>
<div align="center">
:baby::computer: Dotfiles and install guide for the <a href="https://getchip.com/pages/pocketchip">Pocket C.H.I.P.</a> :computer::baby:
</div>

<br/>

## First installation

This is a step-by-step guide to get your Pocket C.H.I.P. ready.

### User settings

The C.H.I.P. ships with built-in `root` and `chip` users, with both `chip` as password. Let's change those and disable root on ssh.

```sh
$ passwd    # change "chip" account's password
$ sudo passwd -l root    # lock the root account from direct login
$ sudo sed -i.old /etc/ssh/sshd_config -e'/PermitRootLogin/s/yes/no/'    # configure sshd to not allow root
$ sudo service ssh restart
```

[Source](http://www.chip-community.org/index.php/Care_and_Feeding)

### Software updates

Your C.H.I.P. might come with ssh server uninstalled.

```sh
$ sudo apt-get update && sudo apt-get upgrade
$ sudo apt-get install openssh-server git
```

[Source](https://bbs.nextthing.co/t/ssh-to-pocket-chip/4694/16)

### Screen calibration

Calibrate your touchscreen using the `xinput-calibrator` utility.

```sh
$ sudo apt-get install xinput-calibrator
$ xinput_calibrator
```

[Source](http://www.chip-community.org/index.php/Calibrate_Touchscreen)

### Setting up the ssh keys

Create your C.H.I.P. ssh keys.

```sh
$ ssh-keygen -t rsa -b 4096    # Generate your keys
$ ssh-add ~/.ssh/id_rsa    # Add your keys to the ssh-agent
```

If you prefer using key-based authentification, change the `sshd` config.

```sh
$ sudo nano /etc/ssh/sshd_config    # Edit the config file
```

Change the `PasswordAuthentification` setting to `no` and restart the ssh service.

```sh
$ sudo service ssh restart
```

### Home screen

You can change the default home screen and get the wonderful [Marshmallow edition](https://bbs.nextthing.co/t/pocket-home-marshmallow-edition/6579/1)

```sh
$ wget -O install-pockethome http://bit.ly/29uWueR
$ chmod +x install-pockethome
$ ./install-pockethome
```

## Dotfiles setup

If you didn't yet, you can now clone this repo to run the dotfiles setup. Inspired by Mathias Bynens' awesome [dotfiles](https://github.com/mathiasbynens/dotfiles).

```sh
$ git clone git@github.com:leoternoir/pocketfiles.git && cd pocketfiles    # Clone this repo
$ source setup.sh    # Execute the setup script
```

You can add custom commands by adding them to `~/.extra`, it will be sourced as well.

## Applications

A list of useful apps working on Pocket C.H.I.P.
Installation guide coming soon.

### GUI Applications

- [Iceweasel](https://wiki.debian.org/fr/Iceweasel)
- More to come soon

### CLI Applications

- Most [NodeJS](https://nodejs.org/en/)-based apps
- More to come soon

## License

MIT.


