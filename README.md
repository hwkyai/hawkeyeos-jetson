# HawkeyeOS-jetson

HawkeyeOS-jetson is an integration of various components to form a Linux-based operating system for NVIDIA Jetson-based Hawkeye devices like the Hawkeye Air and Hawkeye Pro.

## Quickstart
> Note: Exhaustive documentation on building, customizing, and running is available at [developers.hwky.ai][developers]

1. Clone this repository with submodules:
```console
$ git clone --recursive https://github.com/hwkyai/hawkeyeos-jetson.git
```

2. Set the `MACHINE` environment variable to the desired device and build a flashable image. \
An example for a Hawkeye Air device:
```console
$ cd hawkeyeos-jetson
$ export MACHINE=photon-nano
$ ./build.sh hawkeye-image
```
> Note: Builds are done in Docker containers by default. To build directly on the host machine use `nativebuild` command. e.g.: `./build.sh nativebuild hawkeye-image`

3. Connected the device to your computer via USB and put into recovery mode by holding down the button located between the ethernet port and serial console USB connector for 10 seconds.

4. Extract the `tegraflash` package to a temporary location and flash the device:
```console
$ mkdir /tmp/tegraflash
$ tar -xf build/tmp/deploy/images/photon-nano/hawkeye-image-photon-nano.tegraflash.tar.gz -C /tmp/tegraflash
$ cd /tmp/tegraflash
$ sudo ./doflash.sh
```

5. The device will now reboot into HawkeyeOS. You can connect via USB serial console with a baudrate of `115200`. Once the device has booted you can login as user `hawkeye` with password `hawkeye`.

[developers]:https://developers.hwky.ai

## Contributing and Issues

Please refer to [meta-hawkeye/CONTRIBUTING](https://github.com/hwkyai/meta-hawkeye/blob/gatesgarth/CONTRIBUTING.md)

## License

All metadata is Apache-2.0 licensed unless otherwise stated. Source code included
in tree for individual recipes is under the LICENSE stated in each recipe
(.bb file) unless otherwise stated.

[tegra-demo-distro]:https://github.com/OE4T/tegra-demo-distro
