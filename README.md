
Dependencies
------------

Perl

In order to use columbus you need your own version of perl and CPAN installed.

```bash 
$ curl -L http://install.perlbrew.pl | bash
$ echo "source ~/perl5/perlbrew/etc/bashrc" >> $HOME/.profile
$ perlbrew install perl-5.19.5
$ perlbrew use perl-5.19.5
```


Alternatively, you can use [install.hovr2pi](http://install.hovr2pi.org)

```bash
$ curl -l http://install.hovr2pi.org/perlbrew | bash
```

We will also need a way to install and manage perl packages. This can be done
by CPAN but [cpanminus] does an excellent job when combined with [cpan-outdated]
Install cpanium

```bash
$ curl -L http://cpanmin.us | perl - App::cpanminus
```

And then install `cpan-outdated` along with all perl modules using `cpanm`:
```bash
$ cpanm App::cpanoutdated
```

Now that that is bootstrapped, we can upgrade out perl modules automagically:

```bash
$ cpan-outdated -p | cpanm
```

Still, some packages are not in `cpanm` so we have to use CPAN.

```bash
$ cpan
$ install Devel::PPPort
```

```bash
$ printf 'CURSES_LDFLAGS=-lncursesw' >> $HOME/.bashrc
```

Installation of Columbus
========================

```bash
$ wget http://www.univie.ac.at/columbus/C70_beta_pre-release/Columbus.7.0/Col7.0_2013-07-01_linux64.ifc.byterecl_src.tar.gz
```

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

```bash
$ module load gsl ga && echo "module load gsl ga" >> $HOME/.bashrc
```

Now we will need molden. Note, you will need to use the molden from [install.hovr2pi.org/contrib/molden.tar.gz]
due to the use of a deprecated makedepend script provided on their website.

To make things easier, do it in your top level directory of COLUMBUS

```bash
$ cd $COLUMBUS/.. &&  curl -l http://install.hovr2pi.org/molden | bash
```

Now we need to edit the config files for COLUMBUS

```bash
$ cd $COLUMBUS/machine.cfg
```

And update the file `linux64.ifc.byterecl` for stampede
or download mine at (http://install.hovr2pi.org/configs/columbus/linux64.ifc.byterecl.stampede)

```bash
$ wget http://install.hovr2pi.org/configs/columbus/linux64.ifc.byterecl.stampede
```

Next is updating the install.config in `$COLUMBUS/..`
or download mine at (http://install.hovr2pi.org/configs/columbus/install.config.stampede)







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

Dependencies
------------

Perl

In order to use columbus you need your own version of perl and CPAN installed.

```bash 
$ curl -L http://install.perlbrew.pl | bash
$ echo "source ~/perl5/perlbrew/etc/bashrc" >> $HOME/.profile
$ perlbrew install perl-5.19.5
$ perlbrew use perl-5.19.5
```

Now we will need an easy to update all the perl packages. CPAN works but I prefer not to go into the CPAN shell
and instead use `cpanimus` and `cpan-outdated`.

Install cpanium

```bash
$ curl -L http://cpanmin.us | perl - App::cpanminus
```

And then install `cpan-outdated` along with all perl modules using `cpanm`:
```bash
$ cpanm App::cpanoutdated
```

Now that that is bootstrapped, we can upgrade out perl modules automagically:

```bash
$ cpan-outdated -p | cpanm
```

License
-------
See `LICENSE` file distributed with `columbus-stampede` for more information.


Support
-------

If you have questions or need help with using or contributing to `columbus-stampede`,
feel free to email me at csim@hovr2pi.org

