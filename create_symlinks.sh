#!/bin/bash

# Compute location of grx binary
GRX=$(readlink -f $(which grx))

# Compute cabal install-dir
INSTALL_DIR=$(cabal path --installdir)

# Create symlinks
ln --symbolic --force $GRX $INSTALL_DIR/grepl
ln --symbolic --force $GRX $INSTALL_DIR/grls
ln --symbolic --force $GRX $INSTALL_DIR/gr

