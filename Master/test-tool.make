#
#   Master/test-tool.make
#
#   Copyright (C) 1997, 2001 Free Software Foundation, Inc.
#
#   Author:  Scott Christley <scottc@net-community.com>
#   Author:  Nicola Pero <nicola@brainstorm.co.uk>
#
#   This file is part of the GNUstep Makefile Package.
#
#   This library is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License
#   as published by the Free Software Foundation; either version 2
#   of the License, or (at your option) any later version.
#   
#   You should have received a copy of the GNU General Public
#   License along with this library; see the file COPYING.LIB.
#   If not, write to the Free Software Foundation,
#   59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.

TEST_TOOL_NAME := $(strip $(TEST_TOOL_NAME))

ifeq ($(RULES_MAKE_LOADED),)
include $(GNUSTEP_MAKEFILES)/rules.make
endif

# Building of test tools works as in tool.make, except we don't install them.

internal-all:: $(TEST_TOOL_NAME:=.all.test-tool.variables)

internal-clean:: $(TEST_TOOL_NAME:=.clean.test-tool.subprojects)
	rm -rf $(GNUSTEP_OBJ_DIR)

internal-distclean:: $(TEST_TOOL_NAME:=.distclean.test-tool.subprojects)
	rm -rf shared_obj static_obj shared_debug_obj shared_profile_obj \
	  static_debug_obj static_profile_obj shared_profile_debug_obj \
	  static_profile_debug_obj

$(TEST_TOOL_NAME)::
	@$(MAKE) -f $(MAKEFILE_NAME) --no-print-directory \
	         $@.all.test-tool.variables

internal-install::
	@ echo Skipping installation of test tools...

internal-uninstall::
	@ echo Skipping uninstallation of test tools...

## Local variables:
## mode: makefile
## End: