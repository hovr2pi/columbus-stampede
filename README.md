
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
See `LICENSE` file distributed with `QUESO` for more information.

Contributing
------------

Contributions are very welcome.  If you wish to contribute, please
take a few moments to review the [branching model](http://nvie.com/posts/a-successful-git-branching-model/)
`columbus-stampede` utilizes.

Support
-------

If you have questions or need help with using or contributing to `columbus-stampede`,
feel free to email me at csim@hovr2pi.org

