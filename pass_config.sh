#!/bin/bash
sudo sed -i 's/PASS_MAX_DAYS/#PASS_MAX_DAYS/g' &&
sudo sed -i 's/PASS_MIN_DAYS/#PASS_MIN_DAYS/g' &&
sudo sed -i 's/PASS_WARN_AGE\t7/PASS_MAX_DAYS\t30\nPASS_MIN_DAYS\t2\nPASS_WARN_AGE\t7/g'