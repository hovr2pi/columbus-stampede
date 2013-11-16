
Dependencies
------------

Perl

In order to use columbus you need your own version of perl and CPAN installed.

```bash 
$ curl -L http://install.perlbrew.pl | bash
$ echo "source ~/perl5/perlbrew/etc/bashrc" >> $HOME/.profile
$ perlbrew install perl-5.19.5
$ perlbrew use perl-5.19.5


Alternatively, you can use [install.hovr2pi](http://install.hovr2pi.org)

```bash
$ curl -l http://install.hovr2pi.org/perlbrew | bash
```

```


Installation of Columbus
========================

```bash
$ wget http://www.univie.ac.at/columbus/C70_beta_pre-release/Columbus.7.0/Col7.0_2013-07-01_linux64.ifc.byterecl_src.tar.gz
```G

```bash
$ tar xf Col7.0_2013-07-01_linux64.ifc.byterecl_src.tar.gz
```

```bash
$ export COLUMBUS=`pwd`/Columbus 
$ printf 'COLUMBUS'=`pwd`'/Columbus' >> $HOME/.bashrc
```

```bash
$ cd $COLUMBUS/../
$ ./install.automatic cpan
``` 


```
The `columbus-stampede` suite of scripts
=================

`columbus-stampede` is a collection of scripts to drive columbus on stampede
for the generation of potential energy surfaces that will be used
to then calculation state to state reaction rates via QCT.

Installation
------------

```bash
$ echo "module load git" >> ~/.bashrc
$ module load git 
$ cd $WORK
$ git clone https://github.com/hovr2pi/columbus-stampede.git
```



Support
-------

If you have questions or need help with using or contributing to `columbus-stampede`,
feel free to email me at csim@hovr2pi.org

