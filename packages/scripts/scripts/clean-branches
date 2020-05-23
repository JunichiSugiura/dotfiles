#!/bin/sh 

git branch --merged | egrep -v "(^\*|master|develop)" | xargs git branch -d
