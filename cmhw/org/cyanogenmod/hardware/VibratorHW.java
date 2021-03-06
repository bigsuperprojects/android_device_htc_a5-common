/*
 * Copyright (C) 2013 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.cyanogenmod.hardware;

import java.io.File;

import org.cyanogenmod.internal.util.FileUtils;

public class VibratorHW {

    private static String AMP_PATH = "/sys/devices/virtual/timed_output/vibrator/pwm_value_1p";

    public static boolean isSupported() {
        return FileUtils.isFileWritable(AMP_PATH);
    }

    public static int getMaxIntensity()  {
        return 99;
    }
    public static int getMinIntensity()  {
        return 53;
    }
    public static int getWarningThreshold()  {
        return 92;
    }
    public static int getCurIntensity()  {
        return Integer.parseInt(FileUtils.readOneLine(AMP_PATH).replace("%", ""));
    }
    public static int getDefaultIntensity()  {
        return 85;
    }
    public static boolean setIntensity(int intensity)  {
        return FileUtils.writeLine(AMP_PATH, String.valueOf(intensity));
    }
}
