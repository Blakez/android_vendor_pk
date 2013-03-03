# Check for target product
ifeq (pk_d2att,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pk/overlay/aokp/device/d2-common

# include ParanoidAndroid common configuration
include vendor/pk/config/pk_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/d2att/cm.mk)

PRODUCT_NAME := pk_d2att

endif
