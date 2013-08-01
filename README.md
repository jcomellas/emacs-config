# Emacs configuration (mainly) for Erlang

These are Emacs configuration files that are suitable for Erlang development
and would normally be located in your `$HOME/.emacs.d` directory. It has been
created as a hodgepodge of settings acquired from the Internet and created by
me over the years.

This configuration uses the [Solarized](http://ethanschoonover.com/solarized)
theme, ido-mode for path navigation, [Magit](https://github.com/magit/magit)
to work with git repositories, [Flymake](http://flymake.sourceforge.net/) to
report compilation errors when saving and an assortment of little tweaks to
Emacs and its key bindings.

There are only 3 external dependencies: Erlang, [rebar](https://github/rebar/rebar)
and [distel](https://github.com/massemanet/distel). You should first install
the Erlang packages for your operating system. e.g. for Ubuntu/Debian:
```bash
sudo apt-get install erlang
```
Then install rebar:
```bash
git clone https://github.com/rebar/rebar.git
cd rebar
make
sudo cp rebar /usr/local/bin/
```
And then install distel:
```bash
git clone https://github.com/massemanet/distel.git
cd distel
make
sudo make install
```
The other needed packages are auto-downloaded from [ELPA](http://elpa.gnu.org/),
[Marmalade](http://marmalade-repo.org/) or [MELPA](http://melpa.milkbox.net/)
whe Emacs is started. 

You should checkout this project by doing:
```bash
cd $HOME
git clone https://github.com/jcomellas/emacs-config .emacs.d
```

Finally, start Emacs and enjoy!
