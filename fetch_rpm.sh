#!/bin/bash

set -u

vagrant ssh-config > ssh-config.txt
scp -F ssh-config.txt omnibus-ruby:/omnibus-ruby/pkg/\*.rpm pkg/
