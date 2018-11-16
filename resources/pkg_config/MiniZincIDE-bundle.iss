; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "MiniZinc IDE (bundled)"
#define MyAppPublisher "Data61 and Monash University"
#define MyAppURL "http://www.minizinc.org"
#define MyAppExeName "MiniZincIDE.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{80FFFA5B-5C33-442E-8C26-A8CD257EFD97}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
LicenseFile={#MyAppDirectory}\resources\misc\COMBINED_LICENSE.txt
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputBaseFilename=MiniZincIDE-{#MyAppVersion}-bundled-setup-{#MyAppArch}
Compression=lzma
SolidCompression=yes
ChangesAssociations=yes
ArchitecturesInstallIn64BitMode={#MyApp64Bit}
ArchitecturesAllowed={#MyAppArchitectures}

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "{#MyAppDirectory}\ide\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#MyAppDirectory}\vendor\openssl\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppDirectory}\resources\scripts\fzn-gecode-gist.bat"; DestDir: "{app}"; Flags: ignoreversion

Source: "{#MyAppDirectory}\minizinc\bin\*.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppDirectory}\minizinc\share\minizinc\*"; DestDir: "{app}\share\minizinc"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{#MyAppDirectory}\resources\solvers\*.msc"; DestDir: "{app}\share\minizinc\solvers"; Flags: ignoreversion
Source: "{#MyAppDirectory}\resources\Preferences.json"; DestDir: "{app}\share\minizinc"; Flags: ignoreversion

Source: "{#MyAppDirectory}\vendor\gecode\bin\*"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyAppDirectory}\vendor\gecode\share\gecode\mznlib\*"; DestDir: "{app}\share\minizinc\gecode"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#MyAppDirectory}\vendor\chuffed\bin\fzn-chuffed.exe"; DestDir:"{app}"; Flags: ignoreversion
Source: "{#MyAppDirectory}\vendor\chuffed\share\chuffed\mznlib\*"; DestDir: "{app}\share\minizinc\chuffed"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#MyAppDirectory}\globalizer\bin\minizinc-globalizer.exe"; DestDir:"{app}"; Flags: ignoreversion
Source: "{#MyAppDirectory}\globalizer\share\globalizer\mznlib\*"; DestDir: "{app}\share\minizinc\globalizer"; Flags: ignoreversion recursesubdirs createallsubdirs

Source: "{#MyAppDirectory}\findMUS\bin\findMUS.exe"; DestDir:"{app}"; Flags: ignoreversion

Source: "{#MyMSVCRedist}\*.dll"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#MyUCRTRedist}\*.dll"; DestDir: "{app}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Registry]
Root: HKCR; Subkey: ".mzp"; ValueType: string; ValueName: ""; ValueData: "MiniZincProjectFile"; Flags: uninsdeletevalue;
Root: HKCR; Subkey: "MiniZincProjectFile"; ValueType: string; ValueName: ""; ValueData: "MiniZinc project"; Flags: uninsdeletevalue;
Root: HKCR; Subkey: "MiniZincProjectFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKCR; Subkey: "MiniZincProjectFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Root: HKCR; Subkey: ".mzn"; ValueType: string; ValueName: ""; ValueData: "MiniZincModelFile"; Flags: uninsdeletevalue;
Root: HKCR; Subkey: "MiniZincModelFile"; ValueType: string; ValueName: ""; ValueData: "MiniZinc model"; Flags: uninsdeletevalue;
Root: HKCR; Subkey: "MiniZincModelFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKCR; Subkey: "MiniZincModelFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Root: HKCR; Subkey: ".dzn"; ValueType: string; ValueName: ""; ValueData: "MiniZincDataFile"; Flags: uninsdeletevalue;
Root: HKCR; Subkey: "MiniZincDataFile"; ValueType: string; ValueName: ""; ValueData: "MiniZinc data"; Flags: uninsdeletevalue;
Root: HKCR; Subkey: "MiniZincDataFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKCR; Subkey: "MiniZincDataFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""

Root: HKCR; Subkey: ".fzn"; ValueType: string; ValueName: ""; ValueData: "MiniZincFlatZincFile"; Flags: uninsdeletevalue;
Root: HKCR; Subkey: "MiniZincFlatZincFile"; ValueType: string; ValueName: ""; ValueData: "FlatZinc instance"; Flags: uninsdeletevalue;
Root: HKCR; Subkey: "MiniZincFlatZincFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#MyAppExeName},0"
Root: HKCR; Subkey: "MiniZincFlatZincFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#MyAppExeName}"" ""%1"""
