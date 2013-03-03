# use AOSP default sounds
PRODUCT_PROPERTY_OVERRIDES += \
  ro.config.ringtone=Themos.ogg \
  ro.config.notification_sound=Proxima.ogg \
  ro.config.alarm_alert=Cesium.ogg

# Copy specific ROM files
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/apk/SuperSU.apk:system/app/SuperSU.apk \
    vendor/pa/prebuilt/common/xbin/su:system/xbin/su

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/pa/prebuilt/common/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/pa/prebuilt/common/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# T-Mobile theme engine
include vendor/pa/config/themes_common.mk

# PK Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pk/overlay/pk/common

### AOKP ###
# AOKP Packages
PRODUCT_PACKAGES += \
    PerformanceControl \
    ROMControl

# AOKP Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pk/overlay/aokp/common

### PARANOID ###
# ParanoidAndroid Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(TARGET_PRODUCT)

# Allow device family to add overlays and use a same prop.conf
ifneq ($(OVERLAY_TARGET),)
    PRODUCT_PACKAGE_OVERLAYS += vendor/pa/overlay/$(OVERLAY_TARGET)
    PA_CONF_SOURCE := $(OVERLAY_TARGET)
else
    PA_CONF_SOURCE := $(TARGET_PRODUCT)
endif

# ParanoidAndroid Proprietary
PRODUCT_COPY_FILES += \
    vendor/pa/prebuilt/common/apk/ParanoidPreferences.apk:system/app/ParanoidPreferences.apk \
    vendor/pa/prebuilt/common/apk/GooManager.apk:system/app/GooManager.apk \
    vendor/pk/prebuilt/apk/ParanoidWallpapers.apk:system/app/ParanoidWallpapers.apk \
    vendor/pk/prebuilt/apk/CMWallpapers.apk:system/app/CMWallpapers.apk \
    vendor/pk/prebuilt/apk/SwagPapers.apk:system/app/SwagPapers.apk \
    vendor/pk/prebuilt/apk/SuperSU.apk:system/app/SuperSU.apk \
    vendor/pk/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/properties.conf \
    vendor/pk/prebuilt/pa/$(PA_CONF_SOURCE).conf:system/etc/paranoid/backup.conf

BOARD := $(subst pk_,,$(TARGET_PRODUCT))

# Add CM release version
CM_RELEASE := true
CM_BUILD := $(BOARD)

# Add PA release version
PA_VERSION_MAJOR = 3
PA_VERSION_MINOR = 1
PA_VERSION_MAINTENANCE = 0
PA_PREF_REVISION = 1
VERSION := $(PA_VERSION_MAJOR).$(PA_VERSION_MINOR)$(PA_VERSION_MAINTENANCE)
PA_VERSION := pa_$(BOARD)-$(VERSION)-$(shell date +%0d%^b%Y-%H%M%S)

# PK version
PK_VERSION_MAJOR = 2
PK_VERSION_MINOR = 1
PK_VERSION_MAINTENANCE = 0
PK_VERSION := $(PK_VERSION_MAJOR).$(PK_VERSION_MINOR).$(PK_VERSION_MAINTENANCE)

TARGET_CUSTOM_RELEASETOOL := vendor/pk/tools/squisher

PRODUCT_PROPERTY_OVERRIDES += \
    ro.pk.version=$(PK_VERSION) \
    ro.modversion=$(PK_VERSION) \
    ro.pa.family=$(PA_CONF_SOURCE) \
    ro.pa.version=$(VERSION) \
    ro.papref.revision=$(PA_PREF_REVISION) \
    ro.aokp.version=$(BOARD)_jb-mr1_build-1 \
    ro.goo.developerid=thebz1 \
    ro.goo.rom=paranoidkangdroid \
    ro.goo.version=210000000000
