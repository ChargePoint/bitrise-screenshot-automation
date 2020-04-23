#  bitrise-screenshot-automation

This is an example project for the first virtual Bitrise User Group (BUG) talk, "Automating Dark Mode Screenshots with Xcode 11".

## Setup

The included bitrise.yml includes the workflow ```screenshots``` from the talk.

### Bitrise

If you want to run directly on Bitrise, fork the project & add a new app to your Bitrise account with your fork's GitHub URL.  You can set the Bitrise app to be Public to take advantage of Bitrise's open source free usage.

Once set-up, open up the Workflow Editor & go to the bitrise.yml tab & you can edit in the changes you find in the ```bitrise.yml``` file in this repository.

Run the ```screenshots``` workflow

### Running Locally

#### Warning

Some of the script steps are overzealous & will modify settings in all installed Simulators.  This isn't a problem when running on Bitrise since Bitrise uses a VM, but if you run this locally, you may experience issues that will require you to reset the Simulators via ```xcrun simctl erase <device>```.

To avoid these issues, modify these scripts in the bitrise.yml to give a specific Simulator or Simulators you want to modify.

For example, 

```
find ~/Library/Developer/CoreSimulator/Devices/* -type d -maxdepth 0 -exec /usr/libexec/PlistBuddy -c "Delete :AppleLanguages" -c "Add :AppleLanguages array" -c "Add :AppleLanguages:0 string $CHARGEPOINT_IOS_DEVICE_LANGUAGE" -c "Delete :AppleLocale" -c "Add :AppleLocale string $CHARGEPOINT_IOS_DEVICE_REGION" {}/data/Library/Preferences/.GlobalPreferences.plist \;
```

Could be rewritten to the following for the Simulator ```AFA116C5-FFF2-4314-A4F5-7599DC80C60A```

```
/usr/libexec/PlistBuddy -c "Delete :AppleLanguages" -c "Add :AppleLanguages array" -c "Add :AppleLanguages:0 string $CHARGEPOINT_IOS_DEVICE_LANGUAGE" -c "Delete :AppleLocale" -c "Add :AppleLocale string $CHARGEPOINT_IOS_DEVICE_REGION" ~/Library/Developer/CoreSimulator/Devices/AFA116C5-FFF2-4314-A4F5-7599DC80C60A/data/Library/Preferences/.GlobalPreferences.plist
```

In particular, any of the Simulator modifying commands (changing languages, changing Dark Mode/Light Mode) should be reviewed & modified for use on a non-VM.

#### Running Locally

Please review the warning above if you're not running in a VM before doing the following.

Install the Bitrise CLI tools

```brew update && brew install bitrise```

Then you can run by doing

```bitrise run --workflow screenshots```
