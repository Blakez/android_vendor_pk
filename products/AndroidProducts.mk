ifeq (pk_d2att,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/pk_d2att.mk
endif
ifeq (pk_d2tmo,$(TARGET_PRODUCT))
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/pk_d2tmo.mk
endif

