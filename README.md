# UOX3
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html) [![Coverity Scan Build Status](https://scan.coverity.com/projects/23322/badge.svg)](https://scan.coverity.com/projects/ultima-offline-experiment-3)

**master** ![Windows x86 Build](https://github.com/UOX3DevTeam/UOX3/workflows/Windows%20x86%20Build/badge.svg?branch=master) ![Windows x64 Build](https://github.com/UOX3DevTeam/UOX3/workflows/Windows%20x64%20Build/badge.svg?branch=master) ![Linux x64 Build](https://github.com/UOX3DevTeam/UOX3/workflows/Linux%20x64%20Build/badge.svg?branch=master)

**develop** ![Windows x86 Build - develop](https://github.com/UOX3DevTeam/UOX3/workflows/Windows%20x86%20Build/badge.svg?branch=develop) ![Windows x64 Build - develop](https://github.com/UOX3DevTeam/UOX3/workflows/Windows%20x64%20Build/badge.svg?branch=develop) ![Windows x64 Build - develop](https://github.com/UOX3DevTeam/UOX3/workflows/Linux%20x64%20Build/badge.svg?branch=develop)

**Ultima Offline eXperiment 3** - the original open source Ultima Online server emulator, allowing people to run their own, custom UO shards since 1997. Comes with cross-platform 64-bit support for **Windows**, **Linux** and **macOS**. News, releases, forums, additional documentation and more can be found at https://www.uox3.org

Supported UO Client versions: **~4.0.0p** to **~7.0.91.15** (with encryption removed by [ClassicUO](https://www.classicuo.eu), [Razor](https://github.com/msturgill/razor/releases) or similar tools). For additional details on UO client compatibility, check https://www.uox3.org/forums/viewtopic.php?f=1&t=2289

UOX3 relies on **SpiderMonkey v1.7.0** for its JS-based scripting engine, and on **zlib-1.2.11** for data compression matters, and comes bundled with specific, compatible versions of these.

Join the [UOX3 Discord](https://discord.gg/uBAXxhF) for support and/or a quick chat!

---

## Building **UOX3**
### Environment setup

**UOX3** requires a C++ compiler supporting the C++17 standards.

<details>
<summary>Obtaining a build environment</summary>

1) Obtaining the basic build system (C++ and supporting tools)  
	- **Windows**  
		- [Visual Studio Community Edition](https://visualstudio.microsoft.com/vs/features/cplusplus/) 
	- **macOS**  
		- From the app store application, select XCode, and install. This will install the XCode integrated development environment  
		
		or
		
		- From a Terminal windows: `xcode-select --install` -- This will install XCode command line tools  
	- **Linux**  
		- `sudo apt install build-essential` -- This will install a c++ compiler, make, and other essential build components  
	- **FreeBSD** 
		- FreeBSD comes with a c++ compiler (clang) installed.  
	
2) Obtaining cmake (Optional, only required if not using an IDE, i.e. command line builds)  
	- **Linux** 
		-  Enter from a command prompt: `sudo apt install cmake` -- This will install cmake 
	- **FreeBSD** 
		- Enter from a commadn prompt: `sudo pkg install cmake` -- This will install cmake  
	- **Windows** and **macOS** 
		- Download [cmake](https://cmake.org) and enable command line  
</details>

### Obtaining the **UOX3** source code  
<details>
<summary>Obtaining Git and checkout out the code</summary>

1) Obtaining git  
	- Graphical  
		- Download [Github Desktop](https://desktop.github.com)  

	- Command Line  
		- **Linux**  
			- Enter at a command prompt: `sudo apt install git` -- Installs git  
		- **FreeBSD** 
			- Enter at a command prompt: `sudo pkg install git` -- Installs git  
		- **macOS** 
			- Git is part of the XCode command line tool install  
2) Checking out the code
	- Graphical using Github Desktop
		- Run GitHub Desktop and click **File->Clone Repository** from the menu.  
		- Click the **URL** tab, enter **https://github.com/UOX3DevTeam/UOX3.git**, then provide a local path for where you want the UOX3 git repository cloned on your drive.  
		- Click the **Clone** button!
	- Command line
		- Obtain a command/terminal window  
			- **Windows** 
				- Open a Developers Command Prompt from the Windows Start Menu  
			- **All other OS**
				- Open a terminal window   
	- Enter the following: `git clone https://github.com/UOX3DevTeam/UOX3.git` - This will clone the stable master branch of the UOX3 git repository into a subdirectory of the current directory you're in, named UOX3. The latest verified compatible version of SpiderMonkey (v1.7.0) is also included, as well as a minimal set of files required to compile zlib-1.2.11.  
<details>
  <summary>Checking out Other Branches</summary>

If you'd rather grab another branch of the git repository, like the **develop** branch where most updates get pushed first before being merged into the master branch, you can use the following command *after* completing the previous step:
  `git checkout develop`

</details>

</details>

### Creating the executable/binary
**UOX3** supports building from the command line for most OS's and supported Integrated Development Environments on Windows and macOS  

<details>
<summary>Creating the executable/binary</summary>
<details>
<summary>Windows and macOS Integrated Development Environment (Visual Studio/XCode)</summary>

- **Windows**  
	- Visual Studio 2022  
		- Goto the **UOX3\ide\vs2022** directory, and open the uox3.sln file using Visual Studio  
		- Select the Build Solution option from the menu  
		- In **UOX3\ide\vs2022\x64\Release** (or **Debug** depending on build type) will be the uox3 executable  
	- Visual Studio 2017/2019  
		This option requires UOX3 and the supporting libraries be built individually
		- **SpiderMonkey**
			- Navigate to the **UOX3\spidermonkey\ide\VS2017** folder and open the **js32.vcxproj** in Visual Studio.
			- Make sure you have **js32** selected in the Solution Explorer, then select **Release** and either **x64** (64-bit) or **Win32** (32-bit) in the Solution Configuration/Platform dropdown menus  
			- Click **Build > Build js32** from the menu.
			- Visual Studio will compile SpiderMonkey and create **spidermonkey\Release\x64** (64-bit) or **spidermonkey\Release\x86** (32-bit) folders with the compiled **js32.lib** library file contained within. No further actions are necessary here, so you can close the SpiderMonkey VS Solution.
		- **zlib**  
			- Navigate to the **UOX3\zlib\ide\VS2017** folder and open **zlib.sln** in Visual Studio.  
			- Select **Release** and either **x64** (64-bit) or **Win32** (32-bit) in the Solution Configuration/Platform dropdown menus
			- Visual Studio will compile SpiderMonkey and create **spidermonkey\Release\x64** (64-bit) or **spidermonkey\Release\x86** (32-bit) folders with the compiled **js32.lib** library file contained within. No further actions are necessary here, so you can close the SpiderMonkey VS Solution.  
		- **UOX3**
			- Open **UOX3_Official.sln** from the **UOX3\ide\vs2017** folder.  
			- Make sure you have **UOX3_Official** selected in the Solution Explorer, then select either **Release** or **Debug**, and either **x64** (64-bit) or **Win32** (32-bit) in the *Solution Configuration/Platform dropdown menus*, or via **Build -> Configuration Manager**.  
			- Select **Build -> Build UOX3_Official** to start compiling UOX3. When done, you'll find **UOX3.exe** either in **UOX3\ide\Release\x64** (or **\x86**) or in **UOX3\ide\VS2017\Debug\x64** (or **\86**), depending on your choices in the previous step.  	
- **macOS**  
	- Goto the **UOX3/ide/xcode** directory, and open the uox3.workspace file using XCode  
	- Select Build from the menu  
	- In **UOX3/ide/xcode/build/Products/Release** (or **Debug** depending on build type) will be the uox3 binary  </details>
<details>
<summary>Command Line/Terminal build (ALL Operating systems)</summary>

1) Open a terminal windows    
	- **Windows**  From the windows Start menu, open a Developers Command Prompt  
2) Navigate to your *UOX3* directory where you cloned using git  
2) Create a build location -- `mkdir build`  
3) Move to that locations -- `cd build`  
4) Create the make files   
	- **WINDOWS**  
		- Enter:  `cmake ..\source -DCMAKE_BUILD_TYPE=Release -G"NMake Makefiles"  `  
	- **macOS**   
		- Enter: `cmake ..\source -DCMAKE_BUILD_TYPE=Release -G"Unix Makefiles"  ` 
	- **All Other Operation Systems**  
		- Enter:  `cmake ..\source -DCMAKE_BUILD_TYPE=Release  `  
5) Build the system entering: `cmake --build . --config Release`  
6) The uox3 executable will be in the current (build) directory  
</details>
</details>

## Data setup 
**It is recommended** to run your UOX3 shard from a separate, dedicated directory instead of the data directory in your local UOX3 git repository, to avoid potential git conflicts and accidental overwrites when pulling updates to UOX3 from GitHub in the future.

<details>
  <summary>Copying Required Files to Dedicated UOX3 Directory</summary>

This is an example of how to copy all required files to a directory called UOX3Server in your user account's home directory
1) *navigate to root UOX3 project directory*
2) `mkdir ~/UOX3`
3) `cp Build/uox3 ~/UOX3`

</details>


Once you have all the required files in place, you can follow the regular steps listed under **Installation and Setup > Configuring Your UOX3 Shard** in the UOX3 documentation (see docs folder, or visit https://www.uox3.org/docs/index.html#configureUOX3) to finish your UOX3 setup!

---