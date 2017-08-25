#!/usr/bin/env bash
cd
. ridedocs.sh
cd ~/PycharmProjects/coding-notes/
sphinx-autobuild -p 8888 -H localhost . _build_html