Powershell Dev Bundle
=================

This is my stock powershell bundle for Windows 7 (64-bit) that combines many useful frameworks, utilities, and scripts for easy setup of a new dev environment.   The main focus is upon command-line tools hosted in the excellent Console utility.

###Included Packages###

- Source Control
	- msysGit
	- Git-Tfs
	- tortoiseHg
	- SlikSvn
- Powershell
	- Psake (build tool)
	- PoSh Git
	- PoSh Hg
	- PoSh Svn 
	- PoSh Tfs (my experiment)
- Utilities
	- Notepad++
	- NuGet
	- GnuOnWindows
	- Console
	- lessmsi

### TODO ###

- Complete work on PoSh TFS
- Create script to auto-configure Git, Mercurial, TFS, etc
- Create script to setup environment & paths
- Remove all packages & tools and instead just script their install with something like Chocolatey or Ninite
	- Include Python, Perl, Ruby, Nodejs installs.
- Decide how to handle pulling/pushing secure content such as proxy settings and logon/passwords as needed.
	
### References ###
- *Powershell* by David Findley (xpando) - https://bitbucket.org/xpando/powershell
- *PoSh-git* by Keith Dahlby - https://github.com/dahlbyk/posh-git
- *PoSh-hg* by Jeremy Skinner - https://github.com/JeremySkinner/posh-hg

