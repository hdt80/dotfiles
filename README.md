# Dotfiles

Repo for the dotfiles I use. These are managed by `stow`. Each subdir manages dotfiles for a specific application, and the location of the dotfile is the path in that subdir relative the the `$HOME` directory.

Running `./install.sh` will tell `stow` to create symlinks for all the subdirs.

Example: `bash/.bashrc` will create a symlink at `$HOME/.bashrc` to `./bash/.bashrc`.
