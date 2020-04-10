# Swift Spider Robot


## Final project result

<center>
[![Sprider](http://img.youtube.com/vi/5hAmD499sJs/0.jpg)](http://www.youtube.com/watch?v=5hAmD499sJs "Spider")
</center>

## Requirements

Raspberry Pi 2+ or Raspberry Pi 3 Model B

##  Installing Dependencies

To use the provided prebuilt binaries you'll need the install the following dependencies:

```sudo apt install clang libicu-dev libcurl4-nss-dev```

Download last version swift ARM compatible with your board, see table:

[Build Swift On ARM prebuilt-binaries](https://github.com/uraimo/buildSwiftOnARM#prebuilt-binaries)

In this project test are using Swift `4.2.3`


and Download

```wget https://github.com/uraimo/buildSwiftOnARM/releases/download/4.2.3/swift-4.2.3-RPi23-RaspbianStretch.tgz```

Unzip the files to a folder of your choice:

For example: `/usr/local/swift-4.2.3/`

After unzip, export path:

``` export PATH=/usr/local/swift-4.2.3/usr/bin:"${PATH}" ```

Test if everything went right run command:

``` swift --version ```

And the output should be like this:

```
Swift version 4.2.3 (swift-4.2.3-RELEASE)
Target: armv7-unknown-linux-gnueabihf
```

## Build and Run

> I'm running with user sudo due to permission errors in / dev /


`sudo su`

`cd /home/maxi/SwiftProjects/Quadruped`

`export PATH=/usr/local/swift-4.2.3/usr/bin:"${PATH}"`

`swift build`

`swift run`


## 3D printing parts

- [Thingiverse project](https://www.thingiverse.com/thing:1009659/files)
- [Instructables - Spider-RobotQuad](https://www.instructables.com/id/DIY-Spider-RobotQuad-robot-Quadruped/)


## Scheme Raspberry Pi 2 model B

- [Scheme PCA9685](https://hobbycomponents.com/motor-drivers/755-pca9685-16ch-12bit-pwmservo-controller-module)

## This project updated the following libraries

- [GitHub - SwiftyPCA9685](https://github.com/ccarnino/SwiftyPCA9685) - @ccarnino
- [GitHub - SMBus-swift](https://github.com/Sephiroth87/SMBus-swift) - @Sephiroth87
