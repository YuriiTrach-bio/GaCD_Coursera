---
title: "CodeBook"
author: "Yurii Trach"
date: "2022-09-16"
output: html_document
---

run_analysis.R file contains the explanations of process of binding and tidying data, so this file does not repeat them.

Variables:

activity - LAYING, SITTING, STANDING, WALKING  WALKING_DOWNSTAIRS, WALKING_UPSTAIRS - the activity that was performed by subject

subject - from 1:30 -the number of a person that was performing activities.

group - test of train - the group the subject belongs to.

value - the number that was recorded by the smartphone.

variable - Mean or Standard deviation - describles what value is.

domain signals - frequency or time - type of domaine signals

dimension - X, Y, Z, NA - the direction of recorded value, not all observations have dimension.

acceleration_type - Body or gravity - type of acceleration signals.

sensor_signal - accelerometer or gyroscope - the device that recorded a value.

jerk_signal - TRUE FALSE - whether observation is derivative in time from the body linear acceleration and angular velocity.

magnitude_signal - TRUE FALSE - the values with calculated magnitudes. 

