#############################################################################
#
# This file is part of the ViSP software.
# Copyright (C) 2005 - 2017 by Inria. All rights reserved.
#
# This software is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# ("GPL") version 2 as published by the Free Software Foundation.
# See the file LICENSE.txt at the root directory of this source
# distribution for additional information about the GNU GPL.
#
# For using ViSP with software that can not be combined with the GNU
# GPL, please contact Inria about acquiring a ViSP Professional
# Edition License.
#
# See http://visp.inria.fr for more information.
#
# This software was developed at:
# Inria Rennes - Bretagne Atlantique
# Campus Universitaire de Beaulieu
# 35042 Rennes Cedex
# France
#
# If you have questions regarding the use of this file, please contact
# Inria at visp@inria.fr
#
# This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
# WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
#
# Description:
# Try to find erfc function.
#
# Authors:
# Souriya Trinh
#
#############################################################################

include(CheckCXXSourceCompiles)

macro(check_math_expr _expr _var)
    if(USE_CPP11)
      set(CMAKE_REQUIRED_FLAGS ${CPP11_CXX_FLAGS})
    endif()
    check_cxx_source_compiles("
#include <cmath>
int main(int argc, char ** argv)
{
    (void)${_expr};
    return 0;
}
" ${_var})
endmacro()

check_math_expr("erfc(1.0)"        HAVE_FUNC_ERFC)
check_math_expr("std::erfc(1.0)"   HAVE_FUNC_STD_ERFC)
