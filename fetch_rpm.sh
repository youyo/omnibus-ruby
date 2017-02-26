#!/bin/bash

set -ux

vagrant ssh-config --host omnibus-ruby > ssh-config.txt
scp -F ssh-config.txt omnibus-ruby:/omnibus-ruby/pkg/\*.rpm pkg/
