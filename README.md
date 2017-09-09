# QtRpi Docker image

This image is made for crosscompiling Qt for the Raspberry Pi without the setup hassle. It builds upon the tools from the [QtRpi project](https://www.qtrpi.com).

## How to use this image

Currently there are two different tags available:

- `rpi3-qt5.6.2`: Crosscompile Qt 5.6.2 for the Raspbarry Pi 3
- `rpi3-qt5.7.0`: Crosscompile Qt 5.7.0 for the Raspbarry Pi 3

Choose the image which fits your needs.

### Building a Qt project

To build a Qt project, mount the directory containing the sources and the project file to the `/sources` path inside the container and run it.
By default the image automatically executes `qmake` and `make` in the current working directory, which is set to `/sources` by default.

#### Example

```
docker pull arose/qtrpi:rpi3-qt5.6.2
docker run -v /someqtprojectfolder/:/source arose/qtrpi:rpi3-qt5.6.2
```

## Questions / Issues

If you got any questions or problems using the image, please visit the [Github Repository](https://github.com/rose-a/qtrpi-docker-image) and write an issue.