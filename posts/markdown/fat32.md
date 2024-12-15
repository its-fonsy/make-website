---
title: How to format a pendrive to FAT32
author: Marco Fontana
date: 2024/12/15
---

# How to format a pendrive to FAT32

List al block devices and choose the right `/dev/sdX`
```shell
$ lsblk
```
If you want to fill the pendrive with all zeros run, it will require some times
```shell
$ sudo dd if=/dev/zero of=/dev/sdX status=progress bs=1M
```
Now that the pendrive is zeroed we are going to use `fdisk` to create a new
partition. Run
```shell
$ sudo fdisk /dev/sdX
```
