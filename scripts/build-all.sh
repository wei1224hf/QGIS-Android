#!/bin/bash

#   ***************************************************************************
#     build-all.sh - builds android QGIS
#      --------------------------------------
#      Date                 : 01-Jun-2011
#      Copyright            : (C) 2011 by Marco Bernasocchi
#      Email                : marco at bernawebdesign.ch
#   ***************************************************************************
#   *                                                                         *
#   *   This program is free software; you can redistribute it and/or modify  *
#   *   it under the terms of the GNU General Public License as published by  *
#   *   the Free Software Foundation; either version 2 of the License, or     *
#   *   (at your option) any later version.                                   *
#   *                                                                         *
#   ***************************************************************************/


set -e
start_time=`date +%s`
#######Load config#######
source `dirname $0`/config.conf
export QGIS_ANDROID_BUILD_ALL=1
$SCRIPT_DIR/setup-env.sh $*
$SCRIPT_DIR/build-libs.sh
$SCRIPT_DIR/build-qgis.sh -c
$SCRIPT_DIR/update-apk-env.sh
$SCRIPT_DIR/build-apk.sh

end_time=`date +%s`
seconds=`expr $end_time - $start_time`
minutes=$((seconds / 60))
seconds=$((seconds % 60))
echo "Successfully built all in $minutes minutes and $seconds seconds"

