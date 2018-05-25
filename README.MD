# Introduction
This repository represents the platform of our MGSE project.

## Prerequisites
1. Install [Java 8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html). Check java installation with `java -version`
2. Install [Xtext](https://www.eclipse.org/Xtext/download.html)
3. Install [Gradle](https://gradle.org/install/).Check gradle installation with `gradle -v`

## Structure of this repository

### Platform build
* `languages.txt`: Each line of this file represents a relative (or absolute) path of a *Gradle* project, that will be included in the platform build
* `buildPlatform.py`: Builds all *Gradle* projects defined in `languages.txt` with *Python 3.6*

### Folder structure
Each folder on the first level should contain a *Xtext project* that is build with *Gradle*
Example:
* `glossary`
* `glossary/build.gradle`
* `glossary/de.hs_coburg.mgse.platform.glossary`
* `glossary/de.hs_coburg.mgse.platform.glossary.ide`
* `glossary/de.hs_coburg.mgse.platform.glossary.target`
* `glossary/de.hs_coburg.mgse.platform.glossary.tests`
* `glossary/de.hs_coburg.mgse.platform.glossary.ui`
* `glossary/de.hs_coburg.mgse.platform.glossary.ui.tests`

`
# Xtext usage

## Import platform projects to current workspace
1. File -> Open Projects from File System... -> Directory...
2. Choose **THIS** folder
3. Deselect the following projects:
    1. `platform`
    2. `platform-models/*` (All projects from `platform-models` folder)
4. Finish

## Create new language
1. File -> New -> Project... -> Xtext Project -> Next
    1. Project name: `de.hs_coburg.mgse.platform.<your.dsl.name>`
    2. Use default location: `false`
    3. Location: `${some_path}/platform/de.hs_coburg.mgse.platform.<your.dsl.name>`
    4. Name: `de.hs_coburg.mgse.platform.<your.dsl.name>.<YourDslNameModel>` (Second name in PascalCase)
    5. Extensions: Choose your file extension wisely. You can't change it that easy (!)
2. Next
3. Preferred Build System: `Gradle`
4. Finish
5. `de.hs_coburg.mgse.platform.<your.dsl.name>.parent` -> Refactor -> Rename -> `<your.dsl.name>` -> OK
6. `de.hs_coburg.mgse.platform.<your.dsl.name>.tests` -> Open `src/de.hs_coburg.mgse.platform.<your.dsl.name>.tests/<YourDslNameModel>ParsingTest.java` -> delete/comment out method `deleteModel()`
7. Open terminal/command prompt in `<your.dsl.name>` and try to build via `gradle build`. If `gradle build` fails, contact me (blue995)

**Result:**
* Project: `<your.dsl.name>` (Wraps around the subprojects)
* Subprojects:
    * `de.hs_coburg.mgse.platform.<your.dsl.name>`
    * `de.hs_coburg.mgse.platform.<your.dsl.name>.ide`
    * `de.hs_coburg.mgse.platform.<your.dsl.name>.target`
    * `de.hs_coburg.mgse.platform.<your.dsl.name>.tests`
    * `de.hs_coburg.mgse.platform.<your.dsl.name>.ui`
    * `de.hs_coburg.mgse.platform.<your.dsl.name>.ui.tests`

## Language A uses Language B
The languages used in this example follow the folder structure described above:
* `A/de.hs_coburg.mgse.platform.A`
* `A/de.hs_coburg.mgse.platform.A.ui`
* ...

### Get your dependencies right (Eclipse)
1. `A/de.hs_coburg.mgse.platform.A/META-INF/MANIFEST.MF` -> Dependencies -> (Required Plug-ins) Add...
    * Add `de.hs_coburg.mgse.platform.B` and `de.hs_coburg.mgse.platform.B.ui`
    * Repeat this procedure for the following projects:
        * `A/de.hs_coburg.mgse.platform.A.ui`
        * `A/de.hs_coburg.mgse.platform.A.ide`
2. Open `de.hs_coburg.mgse.platform.A/src/de.hs_coburg.mgse.platform.A/GenerateA.mw2`
Add this line AFTER the `fileExtensions` property:  
`referencedResource = "platform:/resource/de.hs_coburg.mgse.platform.B/model/generated/B.genmodel"`

### Get your dependencies right (Gradle)
1. Open `A/settings.gradle` and add the following lines:
    * `include 'de.hs_coburg.mgse.platform.B'`
    * `project(':de.hs_coburg.mgse.platform.B').projectDir = file('../B/de.hs_coburg.mgse.platform.B')`
2. Open `A/de.hs_coburg.mgse.platform.A` and add the following line to `dependencies`:
    * `compile project(":de.hs_coburg.mgse.platform.B")`