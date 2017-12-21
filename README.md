# General template C project

Skeleton of a C application for when I need to start new projects, just clone this repository.

## Prerequisites

To analyze the code according to the linux kernel code style, the perl checkpatch script is used. It is in the scripts folder. Without much worry of how to install, since it is only necessary to execute.

The static analysis of the code is done through cppcheck. If you use ubuntu 14+ or some distro based on it, you can install using:

```
$ sudo apt-get install cppcheck
```

It is open source and the repository is here in [github](https://github.com/danmar/cppcheck). If you want the latest version, just compile from the source:

```
$ git clone git://github.com/danmar/cppcheck.git
$ cd cppcheck/
$ git checkout 1.70
$ make CFGDIR=/etc/cppcheck/ HAVE_RULES=yes
$ sudo CFGDIR=/etc/cppcheck/ make install
```

To check if it really worked:

```
$ cppcheck --version
Cppcheck 1.70
```

## Usage

To run static analysis:

```
$ make cppcheck 
```
To check encoding pattern:

```
$ make checkpatch
```

To compile:

```
$ make all 
```

To delete the unnecessary files:

```
$ make clean 
```

## Authors

* **Rafael Coelho** - [rafaellcoellho](https://github.com/rafaellcoellho)
