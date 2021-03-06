<p align="left">
  <img src="http://www.backelite.com/bkimages/extension/backelite/design/backelite/templates/img/header_logo.png/3840/2160/PNG" width="100"/>
</p>

| Branch   |      Status                                                                                                                                |
|----------|:------------------------------------------------------------------------------------------------------------------------------------------:|
| master | [![Build Status](https://travis-ci.org/Backelite/sonar-swift.svg?branch=master)](https://travis-ci.org/Backelite/sonar-swift)  |
| develop| [![Build Status](https://travis-ci.org/Backelite/sonar-swift.svg?branch=develop)](https://travis-ci.org/Backelite/sonar-swift) |

SonarQube Plugin for Swift
================================

This is an open source initiative for Apple Swift language support in SonarQube.
The structure of the plugin is based on the [sonar-objective-c](https://github.com/octo-technology/sonar-objective-c) plugin.

<p align="center">
  <img src="screenshot.png" alt="Example iOS SonarQube dashboard" width="100%"/>
</p>

###Features


| Feature 		| Supported	| Details	|
|---------------|----------|:-----------:|
| Complexity	|YES			|Uses [Lizard](https://github.com/terryyin/lizard)			|
| Design		|NO			|			|
| Documentation	|YES		|			|
| Duplications	|YES		|			|
| Issues		|YES		| Uses [SwiftLint](https://github.com/realm/SwiftLint)|
| Size			|YES		|			|
| Tests			|YES		| Uses xcodebuild + xcpretty [xcpretty](https://github.com/supermarin/xcpretty)			|
| Code coverage	|YES			| Uses [slather](https://github.com/venmo/slather)			|


###Download

Checkout the [Releases](https://github.com/Backelite/sonar-swift/releases) page.

###Release history

####0.1.3
- Lizard complexity report support

####0.1.2
- SwiftLint 0.5.1 support (new rules added).
- Added *sonar.swift.simulator* key in *sonar-project.properties* to select destination simulator for running tests
- SwiftLint scans source directories only

####0.1.1
- SwiftLint 0.4.0 support (new rules added).

####0.1.0
- Initial release.



###Prerequisites

- a Mac with Xcode 7 or +
- [SonarQube](http://docs.codehaus.org/display/SONAR/Setup+and+Upgrade) and [SonarQube Runner](http://docs.codehaus.org/display/SONAR/Installing+and+Configuring+SonarQube+Runner) installed ([HomeBrew](http://brew.sh) installed and ```brew install sonar-runner```)
- [xcpretty](https://github.com/supermarin/xcpretty) (```gem install xcpretty```)
- [SwiftLint](https://github.com/realm/SwiftLint) ([HomeBrew](http://brew.sh) installed and ```brew install swiftlint```). Version 0.3.0 or above.
- [slather](https://github.com/venmo/slather) with profdata support (see instructions below)
- [lizard](https://github.com/terryyin/lizard) installed

###Installation of slather with profdata support

At the time, slather does not support profdata. A special version of slather needs t be installed.

To install slather with profdata support, follow those steps :

	git clone https://github.com/mattdelves/slather.git
	cd slather
	git checkout feature-profdata
	gem build slather.gemspec
	gem install --both slather-1.8.1.gem


###Installation (once for all your Swift projects)
- Download the plugin binary into the $SONARQUBE_HOME/extensions/plugins directory
- Copy [run-sonar-swift.sh](https://rawgithub.com/Backelite/sonar-swift/master/src/main/shell/run-sonar-swift.sh) somewhere in your PATH
- Restart the SonarQube server.

###Configuration (once per project)
- Copy [sonar-project.properties](https://raw.githubusercontent.com/Backelite/sonar-swift/master/sonar-project.properties) in your Xcode project root folder (along your .xcodeproj file)
- Edit the ```sonar-project.properties``` file to match your Xcode iOS/MacOS project

**The good news is that you don't have to modify your Xcode project to enable SonarQube!**. Ok, there might be one needed modification if you don't have a specific scheme for your test target, but that's all.

###Analysis
- Run the script ```run-sonar-swift.sh``` in your Xcode project root folder
- Enjoy or file an issue!

###Update (once per plugin update)
- Install the lastest plugin version
- Copy ```run-sonar-swift.sh``` somewhere in your PATH

If you still have *run-sonar-swift.sh* file in each of your project (not recommended), you will need to update all those files.

###Contributing

Feel free to contribute to this plugin by issuing pull requests to this repository.

###License

SonarQube Plugin for Swift is released under the [GNU LGPL 3 license](http://www.gnu.org/licenses/lgpl.txt).
