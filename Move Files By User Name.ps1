#Instructions:
#1. Change the CSV path.
#2. Change the destination path.
#3. Edit the 1st column to include name
#4. Edit 2nd column to include the entire file location (i.e. \\tp-docu-01\docusign\Unknown\File.xlsx)
#5. Run script
#6. Input a name of someone in the CSV file

$CSVPath = "" #Path for CSV
$DestinationPath = "" #Destination path for moving files
$inputName = Read-Host -Prompt "Name" #Prompt user to input a name

$Name = @() #Variable for column 1: Name
$Location = @() #Variable for column 2: Location
#Note: Location needs the full path listed in the cell of the column

#Import the CSV path and filter by columns Name and Location
Import-Csv $CSVPath -Header Name,Location |`
    ForEach-Object {
        if ($inputName -match $_.Name){
            Move-Item -Path $_.Location -Destination $DestinationPath
            Write-Host "Moved the file: " $_.Location
            }
    }