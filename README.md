# UOX3
[![License: GPL v2](https://img.shields.io/badge/License-GPL%20v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html) [![Coverity Scan Build Status](https://scan.coverity.com/projects/23322/badge.svg)](https://scan.coverity.com/projects/ultima-offline-experiment-3)

**master** ![Windows x86 Build](https://github.com/UOX3DevTeam/UOX3/workflows/Windows%20x86%20Build/badge.svg?branch=master) ![Windows x64 Build](https://github.com/UOX3DevTeam/UOX3/workflows/Windows%20x64%20Build/badge.svg?branch=master) ![Linux x64 Build](https://github.com/UOX3DevTeam/UOX3/workflows/Linux%20x64%20Build/badge.svg?branch=master)

**develop** ![Windows x86 Build - develop](https://github.com/UOX3DevTeam/UOX3/workflows/Windows%20x86%20Build/badge.svg?branch=develop) ![Windows x64 Build - develop](https://github.com/UOX3DevTeam/UOX3/workflows/Windows%20x64%20Build/badge.svg?branch=develop) ![Windows x64 Build - develop](https://github.com/UOX3DevTeam/UOX3/workflows/Linux%20x64%20Build/badge.svg?branch=develop)

**Ultima Offline eXperiment 3** - the original open source Ultima Online server emulator, allowing people to run their own, custom UO shards since 1997. Comes with cross-platform 64-bit support for **Windows**, **Linux** and **macOS**. News, releases, forums, additional documentation and more can be found at https://www.uox3.org

Supported UO Client versions: **~4.0.0p** to **~7.0.91.15** (with encryption removed by [ClassicUO](https://www.classicuo.eu), [Razor](https://github.com/msturgill/razor/releases) or similar tools). For additional details on UO client compatibility, check https://www.uox3.org/forums/viewtopic.php?f=1&t=2289

UOX3 relies on **SpiderMonkey v1.7.0** for its JS-based scripting engine, and on **zlib-1.2.11** for data compression matters, and comes bundled with specific, compatible versions of these.

Join the [UOX3 Discord](https://discord.gg/uBAXxhF) for support and/or a quick chat!

---

# How to compile UOX3...
# ...under Linux or macOS
## Step 1: Clone the UOX3 Git Repository
<details>
  <summary>Using git and Terminal</summary>

First step, open a new terminal and enter the commands below:

1) Install prerequisites:

   * **Linux:** `sudo apt install git` - This will install git if not already installed (Ubuntu/Debian-based Linux variants). If you're using a non-Debian flavour of Linux, use the default package manager that comes with it to install git instead.

   * **macOS:** `xcode-select --install` - This will install git if not already installed, along with required make and gcc tools

   * **FreeBSD:** `pkg install git gmake` - This will install git and gmake if not already installed. Alternatively, build `git` and `gmake` via ports if desired.

2) `git clone https://github.com/UOX3DevTeam/UOX3.git` - This will clone the stable master branch of the UOX3 git repository into a subdirectory of the current directory you're in, named UOX3. The latest verified compatible version of SpiderMonkey (v1.7.0) is also included, as well as a minimal set of files required to compile zlib-1.2.11.

<details>
  <summary>Checking out Other Branches</summary>

  If you'd rather grab another branch of the git repository, like the **develop** branch where most updates get pushed first before being merged into the master branch, you can use the following command *after* completing the previous step:
  `git checkout develop`

</details>
</details>

<details>
  <summary>(macOS alternative) GitHub Desktop</summary>

  1) Download and install the macOS version of [GitHub Desktop](https://desktop.github.com/).
  2) Run GitHub Desktop and click **File->Clone Repository** from the menu.
  3) Click the **URL** tab, enter **https://github.com/UOX3DevTeam/UOX3.git**, then provide a local path for where you want the UOX3 git repository cloned on your drive.
  4) Hit the **Clone** button!

</details>

## Step 2: Compile UOX3
<details>
  <summary>Compiling with CMake and GCC (v9.x and above) or Clang</summary>

You'll need a couple tools before you can compile UOX3 on Linux, like **GNU Make** (*v4.2.1* or higher recommended) and **gcc** (*v9.x* or higher recommended). Install these through your favourite package manager or through your flavour of Linux' variant of the following terminal command (example specific to Debian/Ubuntu Linux flavours):

1) (Linux only) `sudo apt install build-essential`
2) (Linux only) `sudo apt install cmake`


Once these are in place, navigate to the **UOX3** project folder in your terminal and execute the following command from the project's root directory:
 1)'cd Build' - Moves to a build directory
 2)'cmake ../source -DCMAKE_BUILD_TYPE=Release' - Generates make files for building
 3)'cmake --build . --config Release' - Builds the system 
 4)'cp ./uox3 ../data' - This will copy the uox3 binary to the data directory
</details>



---

Once done compiling, you will find the compiled uox3 binary in the root UOX3/Build directory. You can copy this binary to the directory you intend to run your UOX3 shard from, along with all the files and folders contained in the UOX3/data subdirectory.

**It is recommended** to run your UOX3 shard from a separate, dedicated directory instead of the data directory in your local UOX3 git repository, to avoid potential git conflicts and accidental overwrites when pulling updates to UOX3 from GitHub in the future.

<details>
  <summary>Copying Required Files to Dedicated UOX3 Directory</summary>

This is an example of how to copy all required files to a directory called UOX3 in your user account's home directory
1) *navigate to root UOX3 project directory*
2) `mkdir ~/UOX3`
3) `cp Build/uox3 ~/UOX3`

</details>

Once you have all the required files in place, you can follow the regular steps listed under **Installation and Setup > Configuring Your UOX3 Shard** in the UOX3 documentation (see docs folder, or visit https://www.uox3.org/docs/index.html#configureUOX3) to finish your UOX3 setup.

---

# ...under Windows
## Step 1: Clone the UOX3 Git Repository
1) Download and install [GitHub Desktop](https://desktop.githubc.om). If you already have another tool for git installed, you can use that instead.
2) Run GitHub Desktop (or your preferred git tool) and click **File->Clone Repository** from the menu.
3) Click the **URL** tab, enter `https://github.com/UOX3DevTeam/UOX3.git`, then provide a local path for where you want the UOX3 git repository cloned on your drive.
4) Hit the **Clone** button to clone the stable master branch of the UOX3 git repository to the specified local path, along with the latest verified compatible version of SpiderMonkey (v1.7.0).

## Step 2: Compile UOX3

### Option A) Visual Studio 2022 ([Free Community edition](https://visualstudio.microsoft.com/downloads/))
<details>
	<summary>Visual Studio 2022</summary>
	
	*This option will let you use Visual Studio solution/project files to compile both UOX3 and SpiderMonkey with Visual Studio's default VC++ compiler. Note that you can download the [Free Community edition](https://visualstudio.microsoft.com/downloads/) of Visual Studio if you don't have it already. This approach also embeds SpiderMonkey directly inside UOX3 for a slightly larger (~1-2MB) executable, instead of requiring a separate DLL file, and comes with options for compiling either **32-bit** or **64-bit** (default) versions of UOX3.*

***Note:*** You'll need to install **"Desktop development with C++"** via the Visual Studio Installer if you don't have it already, along with the option for this titled **MSVC v141 - VS 2017 C++ x64/x86 build tools (v14.16)**
#### UOX3 ####
1) Navigate to the **UOX3\ide\vs2022** directory
2) Open the **uox3.sln** project in Visual Studio
3) Select **Build -> Build uox3** to start compiling UOX3. When done, you'll find **UOX3.exe** either in **UOX3\ide\Release\x64**  or in **UOX3\ide\VS2017\Debug\x64** , depending on your choices in the previous step.

### Option B) Visual Studio 2017/2019 ([Free Community edition](https://visualstudio.microsoft.com/downloads/))
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

### Option c) command line cmake
<details>
  <summary>Developers Terminal CMake</summary>
1) Goto the Windows Start menu, and open a Developer Command for VS2022 Prompt
2) Navigate to the **UOX3\Build** directory
3) enter: 'cmake ../source -DCMAKE_BUILD_TYPE=Release -G"NMake Makefiles"' - Generates make files for building
4) enter: 'cmake --build . --config Release' - Builds the system 
5) A **uox3.exe** should now be present in the UOX3/Build folder

</details>

---

Once done compiling, you can copy your new **uox3.exe** file from the appropriate output folders (depending on which method and configuration you used) to the root folder of your actual UOX3 project. You'll also need to copy the files and folders contained within the **data** subfolder of the UOX3 repository, if you don't already have these.

**It is recommended** to run your UOX3 shard from a separate, dedicated folder instead of the data folder in your local UOX3 git repository, to avoid potential git conflicts and accidental overwrites when pulling updates to UOX3 from GitHub in the future.

Once you have all the required files in place, you can follow the regular steps listed under **Installation and Setup > Configuring Your UOX3 Shard** in the UOX3 documentation (see docs folder, or visit https://www.uox3.org/docs/index.html#configureUOX3) to finish your UOX3 setup!
