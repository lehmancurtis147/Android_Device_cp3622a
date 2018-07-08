#!/bin/bash

#Module signing workaround... at least until make does it by itself.

for a in $(find out/target/product/cp3622a/system -type f -name *.ko)
do
echo "Performing signing workaround on "$a
kernel/coolpad/msm8909/scripts/sign-file sha512 out/target/product/cp3622a/obj/KERNEL_OBJ/signing_key.priv out/target/product/cp3622a/obj/KERNEL_OBJ/signing_key.0x3F $a
done

