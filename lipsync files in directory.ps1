#Variables
$PROGRAMDIR = 'C:\Batch-Processing\rhubarb.exe'
$SORTDIR = 'C:\Batch-Processing\*.wav.txt'
$DESTINATIONDIR = 'C:\Batch-Processing\finished'
$TARGETDIR = 'C:\Batch-Processing\wavfiles'
$RESULTDIR = 'C:\Batch-Processing\finished'

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