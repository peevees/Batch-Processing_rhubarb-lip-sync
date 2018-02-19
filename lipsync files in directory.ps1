#Variables
$CurrentDir = Get-ScriptDirectory
$PROGRAMDIR
$SORTDIR = 'C:\Batch-Processing\*.wav.txt'
$DESTINATIONDIR = 'C:\Batch-Processing\finished'
$TARGETDIR = 'C:\Batch-Processing\wavfiles'
$RESULTDIR = 'C:\Batch-Processing\finished'

Get-Executor




function Start-BatchProcessing
{
    # Acquires all wave files inside $TARGETDIR
    Get-ChildItem -Path $TARGETDIR -Recurse -Include *.wav | 
        ForEach-Object {
            # For every object create the command String for rhubarb and
            # Execute new process for every object but wait until previous
            # Process is done until next start 
            $NAME = $_.Name
            $FULLNAME = $_.FullName
            Write-Host $FULLNAME
            $HALFSTRING = $FULLNAME + " --extendedShapes GX"
            Write-Host $HALFSTRING
            $FULLSTRING = $HALFSTRING + " -o " + $name + ".txt"
            Write-Host $FULLSTRING
            Write-Host $PROGRAMDIR $FULLSTRING
    
            start-process $PROGRAMDIR $FULLString -wait
            # When process is done move the resulting txt file to $DESTINATIONDIR
            Move-Item -Path $SORTDIR -Destination $DESTINATIONDIR

        
    }
}

#checks for rhubarb.exe otherwise exits
function Get-Executor
{
    $PROGRAMDIR = $CurrentDir + "\rhubarb.exe"
    if((Test-Path -Path $ProgramDir -PathType Leaf)){
       write-host "rhubarb.exe was found!"
       resolve-path "rhubarb.exe"
       
    }
    else
    {
        write-host "rhubarb.exe could not be found, "
        write-host "did you put the script in the same directory as the executor?"
        Read-host "Press any key to exit"
    }

}

#Gets current directory of script
function Get-ScriptDirectory
{
  $Invocation = (Get-Variable MyInvocation -Scope 1).Value
  Split-Path $Invocation.MyCommand.Path
}