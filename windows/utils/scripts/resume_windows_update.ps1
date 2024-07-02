﻿# Copyright 2024 VMware, Inc.
# SPDX-License-Identifier: BSD-2-Clause
#
# Script to remove pausing Windows Update config from registry
#
$win_pause_update_reg_path = "HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings"
$win_exclude_driver_update = 'ExcludeWUDriversInQualityUpdate'
$win_policy_current = "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Update"
$win_policy_update = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\Update"
$win_policy_windows_update = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" 
$win_pause_config = ['PauseUpdatesStartTime', 'PauseUpdatesExpiryTime', 'PauseFeatureUpdatesStartTime', 'PauseFeatureUpdatesEndTime', 'PauseQualityUpdatesStartTime', 'PauseQualityUpdatesEndTime', $win_exclude_driver_update]

If (Test-Path -Path $win_pause_update_reg_path)
{
  foreach ($item in $win_pause_config)
  {
      Remove-ItemProperty -Path $win_pause_update_reg_path -Name $item -Force
  }
}
If (Test-Path -Path $win_policy_current)
{
  Remove-ItemProperty -Path $win_policy_current -Name $win_exclude_driver_update -Force
}
If (Test-Path -Path $win_policy_update)
{
  Remove-ItemProperty -Path $win_policy_update -Name $win_exclude_driver_update -Force
}
If (Test-Path -Path $win_policy_windows_update)
{
  Remove-ItemProperty -Path $win_policy_windows_update -Name $win_exclude_driver_update -Force
}
