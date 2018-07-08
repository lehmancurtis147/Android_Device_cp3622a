include $(CLEAR_VARS)

LOCAL_PATH := $(call my-dir)

$(shell mkdir -p $$PWD/out/target/product/cp3622a/obj/include)
#$(shell cp  -rn $$PWD/device/coolpad/cp3622a/include/common $$PWD/out/target/product/cp3622a/obj/include/)
#$(shell cp  -rn $$PWD/device/coolpad/cp3622a/include/mm-audio $$PWD/out/target/product/cp3622a/obj/include/)
#$(shell cp  -rn $$PWD/device/coolpad/cp3622a/include/libperipheralclient $$PWD/out/target/product/cp3622a/obj/include/)
$(shell cp  -rn $$PWD/device/coolpad/cp3622a/include $$PWD/out/target/product/cp3622a/obj/)
