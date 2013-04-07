# Check for target product
ifeq (pk_quincyatt,$(TARGET_PRODUCT))

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := pa_xhdpi

# AOKP device overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/pk/overlay/aokp/device/quincyatt

#Include Bootanimation
PRODUCT_COPY_FILES += \
    vendor/pk/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# include ParanoidAndroid common configuration
include vendor/pk/config/pk_common.mk

# Inherit CM device configuration
$(call inherit-product, device/samsung/quincyatt/cm.mk)

PRODUCT_NAME := pk_quincyatt

endif
