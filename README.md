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
<details> 
<summary>Setting up the environment</summary>
**UOX3** requires a C++ compiler supporting the C++17 standards.
<details>
<summary>Obtaining a build environment</summary>

1) Obtaining the basic build system (C++ and supporting tools)  

	- **Linux** `sudo apt install build-essential` -- This will install a c++ compiler, make, and other essential build components  
	- **FreeBSD** FreeBSD comes with a c++ compiler (clang) installed.  
	- **Windows** [Visual Studio Community Edition](https://visualstudio.microsoft.com/vs/features/cplusplus/)  
	- **macOS** From the app store application, select XCode, and install. This will install the XCode integrated development environment  
	or  
	- **macOS** From a Terminal windows: `xcode-select --install` -- This will install XCode command line tools  
	
2) Obtaining cmake (Optional, only required if not using an IDE, i.e. command line builds)  
	- **Linux** `sudo apt install cmake` -- This will install cmake 
	- **FreeBSD** `sudo pkg install cmake` -- This will install cmake  
	- **Windows** and **macOS** Download [cmake](https://cmake.org) and enable command line  

3) Obtaining git  
	- Graphical  
		- Download [Github Desktop](https://desktop.github.com)  

	- Command Line  
		- **Linux**  `sudo apt install git` -- Installs git  
		- **FreeBSD** `sudo pkg install git` -- Installs git  
		- **macOS** Git is part of the XCode command line tool install  
</details>
<details>
<summary>Obtaining the UOX3 source code</summary>

</details>
</details>
<details>
<summary>Creating the executable/binary</summary>

<details>
<summary>Windows and macOS Integrated Development Environment (Visual Studio/XCode)</summary>

- **Windows**  
	- Goto the **UOX3\ide\vs2022** directory, and open the uox3.sln file using Visual Studio  
	- Select the Build Solution option from the menu  
	- In **UOX3\ide\vs2022\x64\Release** (or **Debug** depending on build type) will be the uox3 executable  
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
	- **WINDOWS** Enter:  `cmake ..\source -DCMAKE_BUILD_TYPE=Release -G"NMake Makefiles"  `  
	- **All Other Operation Systems** Enter:  `cmake ..\source -DCMAKE_BUILD_TYPE=Release  `  
5) Build the system entering: `cmake --build . --config Release`  
6) The uox3 executable will be in the current (build) directory  
</details>
<details>
  <summary>Visual Studio 2017/2019</summary>

*This option will let you use Visual Studio solution/project files to compile both UOX3 and SpiderMonkey with Visual Studio's default VC++ compiler. Note that you can download the [Free Community edition](https://visualstudio.microsoft.com/downloads/) of Visual Studio if you don't have it already. This approach also embeds SpiderMonkey directly inside UOX3 for a slightly larger (~1-2MB) executable, instead of requiring a separate DLL file, and comes with options for compiling either **32-bit** or **64-bit** (default) versions of UOX3.*

***Note:*** You'll need to install **"Desktop development with C++"** via the Visual Studio Installer if you don't have it already, along with the option for this titled **MSVC v141 - VS 2017 C++ x64/x86 build tools (v14.16)**

#### SpiderMonkey ####
1) Navigate to the **UOX3\spidermonkey\ide\VS2017** folder and open the project folder of your choice*SpiderMonkey*.sln** in Visual Studio.
2) Make sure you have **js32** selected in the Solution Explorer, then select **Release** and either **x64** (64-bit) or **Win32** (32-bit) in the Solution Configuration/Platform dropdown menus
3) Click **Build > Build js32** from the menu.
4) Visual Studio will compile SpiderMonkey and create **spidermonkey\Release\x64** (64-bit) or **spidermonkey\Release\x86** (32-bit) folders with the compiled **js32.lib** library file contained within. No further actions are necessary here, so you can close the SpiderMonkey VS Solution.

### zlib ###
1) Navigate to the **UOX3\zlib\ide\VS2017** folder and open **zlib.sln** in Visual Studio.
2) Select **Release** and either **x64** (64-bit) or **Win32** (32-bit) in the Solution Configuration/Platform dropdown menus
3) Click **Build > Build zlib-static** from the menu.
4) Visual Studio will compile zlib and create **zlib\x64\Release** (64-bit) or **zlib\x86\Release** (32-bit) folders with the compiled **zlib-static.lib** library file contained within. No further actions are necessary here, so you can close the zlib VS Solution.

#### UOX3 ####
1) Open **UOX3_Official.sln** from the **UOX3\ide\vs2017** folder.
2) Make sure you have **UOX3_Official** selected in the Solution Explorer, then select either **Release** or **Debug**, and either **x64** (64-bit) or **Win32** (32-bit) in the *Solution Configuration/Platform dropdown menus*, or via **Build -> Configuration Manager**.
3) Select **Build -> Build UOX3_Official** to start compiling UOX3. When done, you'll find **UOX3.exe** either in **UOX3\ide\Release\x64** (or **\x86**) or in **UOX3\ide\VS2017\Debug\x64** (or **\86**), depending on your choices in the previous step.

<details>
  <summary>Adding SpiderMonkey/zlib references in Configuration Manager</summary>

If VS give you link errors when attempting to build UOX3, references to SpiderMonkey or zlib might have gone missing! Try the following steps to add them back.

1) Right click on **UOX3_Official** in the Solution Explorer, and select Properties.
2) With the desired configuration (ex: Release, x64) selected at the top of the panel, add references to SpiderMonkey and zlib in these sections:
  * *VC++ Directories >* **Include Directories** (add path to SpiderMonkey and zlib root folders)
  * *VC++ Directories >* **Library Directories** (add path to SpiderMonkey **Release\x64** or **Release\x86** folder, as well as zlib **\x64\Release** or **\x86\Release** folder, depending on desired configuration)
  * *VC++ Directories >* **Source Directories** (add path to SpiderMonkey and zlib root folders)
  * *Linker >* **Additional Library Dependencies** (add path to SpiderMonkey **Release\x64** or **Release\x86** folder, as well as zlib **\x64\Release** or **\x86\Release** folder, depending on desired configuration)
Press apply!
Repeat process for both Release and Debug configurations (chosen at top of panel), then retry the UOX3 build process!

</details>
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