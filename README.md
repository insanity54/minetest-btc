# Minetest btc mod

> STATUS: WORK IN PROGRESS, IDEA PHASE.

Adds Bitcoin Lightning Network (LN) to minetest

## Motivation

I love running a Minetest server, but it's prohititively expensive. I want a way to monetize my server so I can afford to keep it online.

## Design

btc connects to your BTCPayServer. When a player interacts with `btc:shop`, a lightning invoice is generated in BTCPayServer. A service fee is calculated based on the value configured in `service_fee` (see settingtypes.txt)

## Install

If you have [minetools](https://github.com/ronoaldo/minetools) installed, install as follows.

`$ contentdb install insanity54/btc`

Otherwise, install this mod just like any other minetest mod. Copy the "btc" folder to your mod folder and enable it in your world.mt with the following line.

`load_mod_btc = true`


## Setup

### Grant http access

btc requires this setting to communicate with your BTCPayServer. Add btc to secure.http_mods in your minetest.conf. 

`secure.http_mods = btc`


### Configuration

Enable the features you want. If you are running a server using the game's UI, you can do this from Minetest main menu. Otherwise, adjust values in your minetest.conf.

See settingtypes.txt for configurable values.



# Reference

[QR Code lib](https://github.com/mt-mods/otp/blob/master/qrencode.lua)

