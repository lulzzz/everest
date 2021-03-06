; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

; This install script requires the installsupp.7z file to be extracted in the parent directory to this file.
; For example: If this script is in C:\test\install\ then the files should be extracted to C:\test\installsupp

#define INCLUDE_TOOLS

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{E016A6A5-39B1-4EE5-94DB-DFC9B3ABAB34}
AppName=MARC-HI Everest Runtime
AppVerName=MARC-HI Everest 1.2 Runtime 
OutputBaseFilename=everest-rt
;InfoBeforeFile=.\installsupp\release\AUG-CTP-2010.txt
LicenseFile=..\License.rtf
AppPublisher=Mohawk College of Applied Arts and Technology
AppPublisherURL=http://marc.mohawkcollege.ca/hi
AppSupportURL=http://marc.mohawkcollege.ca/hi
AppUpdatesURL=http://marc.mohawkcollege.ca/hi
DefaultDirName={pf}\Mohawk College\Everest
DefaultGroupName=Mohawk College\Everest
AllowNoIcons=yes
OutputDir=..\dist
;SetupIconFile=D:\work\appicon.ico
Compression=lzma/ultra
SolidCompression=no
AppCopyright=Copyright (C) 2008-2013, Mohawk College of Applied Arts and Technology
WizardImageFile=install-logo.bmp
WizardSmallImageFile=install-logo-small.bmp

[Languages]
Name: english; MessagesFile: compiler:Default.isl

;[Registry]
;#ifdef INCLUDE_TOOLS
;Root: HKCR; SubKey: .ipj; ValueType: string; ValueName: ; ValueData: InstanceCreator; Flags: uninsdeletevalue
;Root: HKCR; SubKey: InstanceCreator; ValueType: string; ValueName: ; ValueData: HL7v3 Instance Creator Project; Flags: uninsdeletekey
;Root: HKCR; SubKey: InstanceCreator\DefaultIcon; ValueType: string; ValueName: ; ValueData: {app}\ipj.ico; Flags: uninsdeletekey
;Root: HKCR; SubKey: InstanceCreator\shell\open\command; ValueType: string; ValueName: ; ValueData: """{app}\instancecreator.exe"" ""%1"""
;#endif

[Files]
#ifdef INCLUDE_TOOLS
;Source: InstanceCreator\bin\Release\InstanceCreator.exe; DestDir: {app}; Flags: ignoreversion; Components: tools
;Source: InstanceCreator\bin\Release\Resources\*.*; DestDir: {app}\Resources; Flags: ignoreversion; Components: tools
;Source: InstanceCreator\bin\Release\*.dll; DestDir: {app}; Flags: ignoreversion; Components: tools
;Source: InstanceCreator\bin\Release\*.ipj; DestDir: {app}\samples; Flags: ignoreversion; Components: tools
;Source: ApiExplorer\bin\Release\ICSharpCode.TextEditor.pdb; DestDir: {app}; Flags: ignoreversion; Components: tools
;Source: ApiExplorer\bin\Release\ApiExplorer.exe; DestDir: {app}; Flags: ignoreversion; Components: tools
;Source: ApiExplorer\bin\Release\ApiExplorer.exe.config; DestDir: {app}; Flags: ignoreversion; Components: tools
;Source: ApiExplorer\bin\Release\ICSharpCode.NRefactory.dll; DestDir: {app}; Flags: ignoreversion; Components: tools
;Source: ApiExplorer\bin\Release\ICSharpCode.NRefactory.pdb; DestDir: {app}; Flags: ignoreversion; Components: tools
;Source: ApiExplorer\bin\Release\ICSharpCode.TextEditor.dll; DestDir: {app}; Flags: ignoreversion; Components: tools
;Source: InstanceCreator\bin\Release\WeifenLuo.WinFormsUI.Docking.pdb; DestDir: {app}; Flags: ignoreversion; Components: tools
;Source: InstanceCreator\bin\Release\WeifenLuo.WinFormsUI.Docking.dll; DestDir: {app}; Flags: ignoreversion; Components: tools
;Source: ..\..\..\..\..\work\ipj.ico; DestDir: {app}; Flags: ignoreversion; Components: tools
#endif
Source: .\installsupp\netfx\dotNetFx35setup.exe; DestDir: {tmp}; Flags: dontcopy

Source: .\installsupp\cs\MARC.Everest.RMIM.CA.R020401.dll; StrongAssemblyName: MARC.Everest.RMIM.CA.R020401.dll; DestDir: {app}\lib; Flags: ignoreversion; 
;Source: .\installsupp\cs\MARC.Everest.RMIM.CA.R020401.xml; DestDir: {app}\lib; Flags: ignoreversion; 
Source: .\installsupp\cs\MARC.Everest.RMIM.CA.R020402.dll; StrongAssemblyName: MARC.Everest.RMIM.CA.R020402.dll; DestDir: {app}\lib; Flags: ignoreversion;
;Source: .\installsupp\cs\MARC.Everest.RMIM.CA.R020402.xml; DestDir: {app}\lib; Flags: ignoreversion; 
Source: .\installsupp\cs\MARC.Everest.RMIM.CA.R020403.dll; StrongAssemblyName: MARC.Everest.RMIM.CA.R020403.dll; DestDir: {app}\lib; Flags: ignoreversion; 
;Source: .\installsupp\cs\MARC.Everest.RMIM.CA.R020403.xml; DestDir: {app}\lib; Flags: ignoreversion;
Source: .\installsupp\cs\MARC.Everest.RMIM.UV.NE2008.dll; StrongAssemblyName: MARC.Everest.RMIM.UV.NE2008.dll; DestDir: {app}\lib; Flags: ignoreversion; 
;Source: .\installsupp\cs\MARC.Everest.RMIM.UV.NE2008.xml; DestDir: {app}\lib; Flags: ignoreversion; 
Source: .\installsupp\cs\MARC.Everest.RMIM.UV.NE2010.dll; StrongAssemblyName: MARC.Everest.RMIM.UV.NE2010.dll; DestDir: {app}\lib; Flags: ignoreversion; 
;Source: .\installsupp\cs\MARC.Everest.RMIM.UV.NE2010.xml; DestDir: {app}\lib; Flags: ignoreversion; 
Source: .\installsupp\cs\MARC.Everest.RMIM.UV.CDAr2.dll; StrongAssemblyName: MARC.Everest.RMIM.UV.CDAr2.dll; DestDir: {app}\lib; Flags: ignoreversion; 


#ifdef TFSBuild
Source: {#buildpath}\MARC.Everest.dll; StrongAssemblyName: MARC.Everest; DestDir: {app}\lib; Flags: ignoreversion;
Source: {#buildpath}\MARC.Everest.Connectors.File.dll; StrongAssemblyName: MARC.Everest.Connectors.File; DestDir: {app}\lib; Flags: ignoreversion;
Source: {#buildpath}\MARC.Everest.Connectors.MSMQ.dll; StrongAssemblyName: MARC.Everest.Connectors.MSMQ; DestDir: {app}\lib; Flags: ignoreversion;
Source: {#buildpath}\MARC.Everest.Connectors.WCF.dll; StrongAssemblyName: MARC.Everest.Connectors.WCF; DestDir: {app}\lib; Flags: ignoreversion;
;Source: {#buildpath}\MARC.Everest.Formatters.XML.Datatypes.R1.CA.dll; StrongAssemblyName: MARC.Everest.Formatters.XML.Datatypes.R1.CA; DestDir: {app}\lib; Flags: ignoreversion;
Source: {#buildpath}\MARC.Everest.Formatters.XML.Datatypes.R1.dll; StrongAssemblyName: MARC.Everest.Formatters.XML.Datatypes.R1; DestDir: {app}\lib; Flags: ignoreversion;
Source: {#buildpath}\MARC.Everest.Formatters.XML.Datatypes.R2.dll; StrongAssemblyName: MARC.Everest.Formatters.XML.Datatypes.R2; DestDir: {app}\lib; Flags: ignoreversion;
Source: {#buildpath}\MARC.Everest.Formatters.XML.ITS1.dll; StrongAssemblyName: MARC.Everest.Formatters.XML.ITS1; DestDir: {app}\lib; Flags: ignoreversion;
#else
Source: ..\MARC.Everest\bin\Release\MARC.Everest.dll; StrongAssemblyName: MARC.Everest; DestDir: {app}\lib; Flags: ignoreversion;
Source: ..\MARC.Everest.Connectors.File\bin\Release\MARC.Everest.Connectors.File.dll; StrongAssemblyName: MARC.Everest.Connectors.File; DestDir: {app}\lib; Flags: ignoreversion;
Source: ..\MARC.Everest.Connectors.MSMQ\bin\Release\MARC.Everest.Connectors.MSMQ.dll; StrongAssemblyName: MARC.Everest.Connectors.MSMQ; DestDir: {app}\lib; Flags: ignoreversion;
Source: ..\MARC.Everest.Connectors.WCF\bin\Release\MARC.Everest.Connectors.WCF.dll; StrongAssemblyName: MARC.Everest.Connectors.WCF; DestDir: {app}\lib; Flags: ignoreversion;
;Source: ..\MARC.Everest.Formatters.XML.Datatypes.R1\bin\Release\MARC.Everest.Formatters.XML.Datatypes.R1.CA.dll; StrongAssemblyName: MARC.Everest.Formatters.XML.Datatypes.R1.CA; DestDir: {app}\lib; Flags: ignoreversion;
Source: ..\MARC.Everest.Formatters.XML.Datatypes.R1\bin\Release\MARC.Everest.Formatters.XML.Datatypes.R1.dll; StrongAssemblyName: MARC.Everest.Formatters.XML.Datatypes.R1; DestDir: {app}\lib; Flags: ignoreversion;
Source: ..\MARC.Everest.Formatters.XML.Datatypes.R2\bin\Release\MARC.Everest.Formatters.XML.Datatypes.R2.dll; StrongAssemblyName: MARC.Everest.Formatters.XML.Datatypes.R2; DestDir: {app}\lib; Flags: ignoreversion;
Source: ..\MARC.Everest.Formatters.XML.ITS1\bin\Release\MARC.Everest.Formatters.XML.ITS1.dll; StrongAssemblyName: MARC.Everest.Formatters.XML.ITS1; DestDir: {app}\lib; Flags: ignoreversion;
#endif

;Source:http://142.222.45.23/favicon.ico; DestDir:{app};
; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: .\installsupp\isxdl.dll; DestDir: {tmp}

;Source: WcfMetaData\*; DestDir: {app}\src\samples\WcfMetaData; Components: samples; Excludes: *.cache,*.resources,*.exe,*.config,*.pdb,*.xml,*.dll; Flags:recursesubdirs;

[INI]
FileName: {app}\everest.version; Section: Everest; Key: Version; String: RT-1.0

[UninstallRun]
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.RMIM.UV.NE2008.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.RMIM.UV.NE2008"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.RMIM.UV.NE2010.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.RMIM.UV.NE2010"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.RMIM.CA.R020401.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.RMIM.CA.R020401"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.RMIM.CA.R020402.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.RMIM.CA.R020402"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.RMIM.CA.R020403.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.RMIM.CA.R020403"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.Formatters.XML.ITS1.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Formatters.XML.ITS1"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.Formatters.XML.DataTypes.R1.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Formatters.XML.Datatypes.R1"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.Formatters.XML.DataTypes.R2.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Formatters.XML.Datatypes.R2"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.Connectors.WCF.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Connectors.WCF"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.Connectors.File.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Connectors.File"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "uninstall ""{app}\lib\MARC.Everest.Connectors.Msmq.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Connectors.MSMQ"; Flags:runhidden

[Run]
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.RMIM.UV.NE2008.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.RMIM.UV.NE2008"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.RMIM.UV.NE2010.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.RMIM.UV.NE2010"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.RMIM.CA.R020401.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.RMIM.CA.R020401"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.RMIM.CA.R020402.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.RMIM.CA.R020402"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.RMIM.CA.R020403.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.RMIM.CA.R020403"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.Formatters.XML.ITS1.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Formatters.XML.ITS1"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.Formatters.XML.DataTypes.R1.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Formatters.XML.Datatypes.R1"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.Formatters.XML.DataTypes.R2.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Formatters.XML.Datatypes.R2"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.Connectors.WCF.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Connectors.WCF"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.Connectors.File.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Connectors.File"; Flags:runhidden
Filename: "{dotnet20}\ngen.exe"; Parameters: "install ""{app}\lib\MARC.Everest.Connectors.Msmq.dll"" /nologo /silent" ; StatusMsg: "Generating Native Assembly : MARC.Everest.Connectors.MSMQ"; Flags:runhidden

[Code]
var
  dotnetRedistPath: string;
  downloadNeeded, needsUninstall, sept2009, nov2009, jan2010, rc1: boolean;
  dotNetNeeded: boolean;
  memoDependenciesNeeded: string;
	lblSelectMode:	TLabel;
  rdoRuntime, rdoGpmr, rdoTypical, rdoCustom: TRadioButton;

  chkBox : TCheckBox;
  uninstallPageId : integer;
  
procedure isxdl_AddFile(URL, Filename: PChar);
external 'isxdl_AddFile@files:isxdl.dll stdcall';
function isxdl_DownloadFiles(hWnd: Integer): Integer;
external 'isxdl_DownloadFiles@files:isxdl.dll stdcall';
function isxdl_SetOption(Option, Value: PChar): Integer;
external 'isxdl_SetOption@files:isxdl.dll stdcall';

const
  dotnetRedistURL = '{tmp}\dotNetFx35setup.exe';
  // local system for testing...
  // dotnetRedistURL = 'http://192.168.1.1/dotnetfx.exe';

function CurrentDateShort(Param:String): String;
begin
  result := Uppercase(GetDateTimeString('MMM-yyyy', #0, #0));
end;

function CurrentDate(Param:String): String;
begin
  result := GetDateTimeString('yyyymmdd', #0, #0);
end;

function InitializeSetup(): Boolean;

begin
  Result := true;
  dotNetNeeded := false;
  // CTP SEP 2009
  sept2009 := RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{A21E1269-8CDE-43CD-B179-2B6674413077}_is1'); 
  // CTP OCT 2009
  nov2009 := RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{A21E1269-8CDE-43CD-B179-2B6674413078}_is1');
  // CTP JAN 2010
  jan2010 := RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{A21E1269-8CDE-43CD-B179-2B6674413079}_is1');
  // RC1
  rc1 := RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{A21E1269-8CDE-43CD-B179-2B6674413080}_is1') or 
    RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{E016A6A5-39B1-4EE5-94DB-DFC9B3ABAB34}_is1');
  needsUninstall := sept2009 or nov2009 or jan2010 or rc1;
  // Check for required netfx installation
  //if (not GetUserDefaultLangID() = 'English') then begin

        //msgbox('Language Is Not English');

  //end;

  if (not DirExists(ExpandConstant('{win}\Microsoft.NET\Framework\v3.5'))) then begin
    dotNetNeeded := true;
    if (not IsAdminLoggedOn()) then begin
      MsgBox('GPMR needs the Microsoft .NET Framework 3.5 to be installed by an Administrator', mbInformation, MB_OK);
      Result := false;
    end else begin
      memoDependenciesNeeded := memoDependenciesNeeded + '      .NET Framework 3.5' #13;
      dotnetRedistPath := ExpandConstant('{tmp}\dotNetFx35setup.exe');

    end;
  end;

end;

function PrepareToInstall(var needsRestart:Boolean): String;
var
  hWnd: Integer;
  ResultCode : integer;
  uninstallString : string;
begin
     Result := '';

     hWnd := StrToInt(ExpandConstant('{wizardhwnd}'));

     EnableFsRedirection(true);
     
     // Should we uninstall the old?
     if(needsUninstall) then
     if((chkBox.Checked)) then begin
     
		// Sept 2009
         needsUninstall := RegQueryStringValue(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{A21E1269-8CDE-43CD-B179-2B6674413077}_is1', 'UninstallString', uninstallString);
  		if(needsUninstall) then begin
            // Replace
            while(Pos('"',uninstallString) > 0) do begin
              Delete(uninstallString, Pos('"',uninstallString), 1);
            end;

           if(Exec(ExpandConstant(uninstallString), '/silent', '', SW_SHOW, ewWaitUntilTerminated, ResultCode)) then begin

             if not (ResultCode = 0) then begin
              Result := 'Couldn''t uninstall old version of MARC-HI Everest';
             end;
             end
             else begin
              Result := 'Couldn''t launch the Everest uninstall';
            end;
         end;

		// Nov 2009         
		needsUninstall := RegQueryStringValue(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{A21E1269-8CDE-43CD-B179-2B6674413078}_is1', 'UninstallString', uninstallString);
  		if(needsUninstall) then begin
            // Replace
            while(Pos('"',uninstallString) > 0) do begin
              Delete(uninstallString, Pos('"',uninstallString), 1);
            end;

           if(Exec(ExpandConstant(uninstallString), '/silent', '', SW_SHOW, ewWaitUntilTerminated, ResultCode)) then begin

             if not (ResultCode = 0) then begin
              Result := 'Couldn''t uninstall old version of MARC-HI Everest';
             end;
             end
             else begin
              Result := 'Couldn''t launch the Everest uninstall';
            end;
         end;

		// Jan 2010         
		needsUninstall := RegQueryStringValue(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{A21E1269-8CDE-43CD-B179-2B6674413079}_is1', 'UninstallString', uninstallString);
  		if(needsUninstall) then begin
            // Replace
            while(Pos('"',uninstallString) > 0) do begin
              Delete(uninstallString, Pos('"',uninstallString), 1);
            end;

           if(Exec(ExpandConstant(uninstallString), '/silent', '', SW_SHOW, ewWaitUntilTerminated, ResultCode)) then begin

             if not (ResultCode = 0) then begin
              Result := 'Couldn''t uninstall old version of MARC-HI Everest';
             end;
             end
             else begin
              Result := 'Couldn''t launch the Everest uninstall';
            end;
         end;

		// RC1         
		needsUninstall := RegQueryStringValue(HKEY_LOCAL_MACHINE, 'Software\Microsoft\Windows\CurrentVersion\Uninstall\{A21E1269-8CDE-43CD-B179-2B6674413080}_is1', 'UninstallString', uninstallString);
  		if(needsUninstall) then begin
            // Replace
            while(Pos('"',uninstallString) > 0) do begin
              Delete(uninstallString, Pos('"',uninstallString), 1);
            end;

           if(Exec(ExpandConstant(uninstallString), '/silent', '', SW_SHOW, ewWaitUntilTerminated, ResultCode)) then begin

             if not (ResultCode = 0) then begin
              Result := 'Couldn''t uninstall old version of MARC-HI Everest';
             end;
             end
             else begin
              Result := 'Couldn''t launch the Everest uninstall';
            end;
         end;

     end;

    if (Result = '') and (dotNetNeeded = true) then begin

    ExtractTemporaryFile('dotNetFx35setup.exe')
    if Exec(ExpandConstant(dotnetRedistPath), '/passive /norestart', '', SW_SHOW, ewWaitUntilTerminated, ResultCode) then begin
        // handle success if necessary; ResultCode contains the exit code
        if not (ResultCode = 0) then begin
          Result := '.NET Framework 3.5 is Required';
        end;
      end else begin
        // handle failure if necessary; ResultCode contains the error code
          Result := '.NET Framework 3.5 is Required';
      end;
    end;
end;

function UpdateReadyMemo(Space, NewLine, MemoUserInfoInfo, MemoDirInfo, MemoTypeInfo, MemoComponentsInfo, MemoGroupInfo, MemoTasksInfo: String): String;
var
  s: string;

begin
  if memoDependenciesNeeded <> '' then s := s + 'Dependencies that will be automatically downloaded And installed:' + NewLine + memoDependenciesNeeded + NewLine;
  if(needsUninstall) then
    if(chkBox.Checked) then begin
		s := s + 'Uninstall Old Frameworks' + NewLine;
		if(sept2009) then	
			s := s + '       Uninstall Sepember CTP of MARC-HI Everest' + NewLine;
		if(nov2009) then
			s := s + '       Uninstall November CTP of MARC-HI Everest' + NewLine;
		if(jan2010) then
			s := s + '       Uninstall January 2010 CTP of MARC-HI Everest' + NewLine;
		if(rc1) then
			s := s + '       Uninstall Release Candidate 1 of MARC-HI Everest' + NewLine;
	end;
	
  s := s + MemoDirInfo + NewLine;

  Result := s
end;


// Custom Form has become active
procedure CustomForm_Activate(Page: TWizardPage);
begin
end;

// Should the custom form be skipped
function ShouldSkipPage(Page:Integer) : Boolean;
begin
  (*if((Page = wpSelectComponents) and rdoTypical.Checked) then begin
    Result := true;
  end
  else begin*)
  	Result := false;
//  end;
end;

// Back click supported on the custom form
function CustomForm_BackButtonClick(Page: TWizardPage): Boolean;
begin
	Result := true;
end;

// When the next button is clicked
function CustomForm_NextButtonClick(Page: TWizardPage): Boolean;
var
  SelectedComponents:String;
begin
  // Todo: Skip the select components
  SelectedComponents := WizardSelectedComponents(false);
  Result := true;
end;

/// When the cancel button is clicked
procedure CustomForm_CancelButtonClick(Page: TWizardPage; var Cancel, Confirm:Boolean);
begin
end;


// Create the choose install method option
function CustomForm_CreatePage(PreviousPageId: Integer) : Integer;
var
	Page: TWizardPage;
	
begin
	Page := CreateCustomPage( PreviousPageId, ExpandConstant('Select Install Method'), ExpandConstant('Please choose the options you would like installed'));
	lblSelectMode := TLabel.Create(Page);
	with lblSelectMode do begin
		Parent := Page.Surface;
		Caption := ExpandConstant('Please select the type of installation you wish to perform');
		Left := ScaleX(30);
		Top := ScaleY(16);
		Width := ScaleX(341);
		Height := ScaleY(52);
	end;

	rdoTypical := TRadioButton.Create(Page);
	rdoCustom := TRadioButton.Create(Page);
	rdoRuntime := TRadioButton.Create(Page);
	rdoGpmr := TRadioButton.Create(page);
	with rdoTypical do begin
		Parent := Page.Surface;
		Caption := 'Complete Install (min 160 MB - Recommended)';
		Left := ScaleX(40);
		Top := ScaleY(46);
		Width := ScaleX(341);
		Height := ScaleY(21);
		TabOrder := 0;
		Checked := true;
	end;
	with rdoCustom do begin
		Parent := Page.Surface;
		Caption := 'Custom Install (min 1 MB)';
		Left := ScaleX(40);
		Top := ScaleY(112);
		Width := ScaleX(341);
		Height := ScaleY(21);
		TabOrder := 3;
	end;
  with rdoGpmr do begin
		Parent := Page.Surface;
		Caption := 'GPMR & Tooling (min 3 MB)';
		Left := ScaleX(40);
		Top := ScaleY(68);
		Width := ScaleX(341);
		Height := ScaleY(21);
		TabOrder := 1;
	end;
	with rdoRuntime do begin
		Parent := Page.Surface;
		Caption := 'Runtime Install (min 42 MB)';
		Left := ScaleX(40);
		Top := ScaleY(90);
		Width := ScaleX(341);
		Height := ScaleY(21);
		TabOrder := 2;
	end;
	with Page do begin
		OnActivate := @CustomForm_Activate;
		OnBackButtonClick := @CustomForm_BackButtonClick;
		OnNextButtonClick := @CustomForm_NextButtonClick;
		OnCancelButtonClick := @CustomForm_CancelButtonClick;
	end;

	Result := Page.ID;
end;

function UninstallForm_CreatePage(PreviousPageId : Integer) : Integer  ;
var
  Page : TWizardPage;
  lblDescription : TLabel;
begin
  Page := CreateCustomPage( PreviousPageId, ExpandConstant('Uninstall Previous Versions'), ExpandConstant('Setup has detected previous versions of the Everest Framework'));
  
  // Select mode
  lblSelectMode := TLabel.Create(Page);
	with lblSelectMode do begin
		Parent := Page.Surface;
		Caption := ExpandConstant('Setup has detected previous versions of the MARC-HI Everest Framework'  + #13 + #10);
		Caption := Caption + ExpandConstant('which should be removed before installing this version');
		Left := ScaleX(25);
		Top := ScaleY(16);
		Width := ScaleX(354);
		Height := ScaleY(52);
	end;
	
	// Check to uninstall
	chkBox := TCheckBox.Create(Page);
	with chkBox do begin
		Parent := Page.Surface;
		Caption := ExpandConstant('Uninstall previous versions of MARC-HI Everest (Recommended)');
		Left := ScaleX(40);
		Top := ScaleY(78);
		Width := ScaleX(348);
		Height := ScaleY(52);
		Checked := true;
	end;
	
	Result := Page.ID;
end;

procedure InitializeWizard();
begin
	//CustomForm_CreatePage(wpSelectDir);
	if(needsUninstall) then
  	uninstallPageId := UninstallForm_CreatePage(wpWelcome);
  	
end;

