$File = "Day 4/Day4-Input.txt"
$ElfPairs = Get-Content $File | ConvertFrom-Csv
$EncompassedPairs = 0
$AnyOverlap =0

ForEach ($Pair in $ElfPairs)
{
    $ElfPairArray1 = @($($Pair.Pair1.Split("-")[0]..$Pair.Pair1.Split("-")[1]))
    $ElfPairArray2 = @($($Pair.Pair2.Split("-")[0]..$Pair.Pair2.Split("-")[1]))
    $Compare = Compare-Object -ReferenceObject $ElfPairArray1 -DifferenceObject $ElfPairArray2 -IncludeEqual -ExcludeDifferent
    If ($Compare.Count -eq $ElfPairArray1.count -or $Compare.Count -eq $ElfPairArray2.Count)
    {
        $EncompassedPairs ++
    }
    $Overlap = $false
    ForEach ($Pair1 in $ElfPairArray1)
    {
        If ($ElfPairArray2 -contains $Pair1)
        {
            $Overlap = $true
        }   
    }
    if ($Overlap){$AnyOverlap ++}
}

Write-Host "Fully Encompassed Pairs: $EncompassedPairs"
Write-Host "Partially encompassed pairs: $AnyOverlap"

Write-Host "Done"