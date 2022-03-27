#	To build PIDSA.exe on linux, using mono, install "mono", and run:
#./build_mono.sh

# On linux, instead of System.Data.SQLite.dll, program is using Mono.Data.SQLite.dll.
# This DLL contains, near PISDA.exe.
# PISDA.exe can be runned with this file, on linux, using mono.

#	Compile PIDSA.exe witn "Mono.Data.SQLite.dll"
csc /out:PISDA.exe /reference:Mono.Data.Sqlite.dll PISDA.cs

#	run PISDA.exe with Mono, on linux:
mono PISDA.exe

# After try to run on windows "PISDA.exe", which compiled on linux, with "Mono.Data.SQLite.dll",
#	program return throw-exception, about "sqlite3.dll" not found.
#	"sqlite3.dll" it's renamed "System.Data.SQLite.dll", because there is contains "SQLite.Interop.dll", inside.
#	This file need to run "PIDSA.exe" with "Mono.Data.SQLite.dll", on windows,
#	but filename of this file must to be "sqlite3.dll", to provide access there, from "Mono.Data.SQLite.dll", on windows.
#		Copy "System.Data.SQLite.dll" to "sqlite3.dll".
cp "System.Data.Sqlite.dll" "sqlite3.dll"

#	Now, PISDA.exe can be runned on windows, with .NET Framework 4.0. On Windows10, there is throw-exception, because .NET Framework 4.8 there.