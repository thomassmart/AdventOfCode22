$InputFile = "Day3-Input.txt"
$RuckSacks = Get-Content $InputFile

$TotalPriorities = 0

$PointsMap = New-Object -TypeName hashtable
$Points = 0
97..122 | %{
    $Points ++
    $PointsMap["$([char]$_)"] = $Points
}
65..90 | %{
    $Points ++
    $PointsMap["$([char]$_)"] = $Points
}

ForEach ($RuckSack in $RuckSacks){
    $RuckSackPriority = 0
    $StrLength = $RuckSack.length
    $Compartment1 = $RuckSack.Substring(0,$StrLength/2)
    $Compartment2 = $RuckSack.Substring($StrLength/2,$StrLength/2)
    ForEach($Char in ($Compartment1.ToCharArray()| select -Unique))
    {
        If($Compartment2.ToCharArray() -ccontains $Char){
            Write-Host "Duplicate Item Found :: $Char :: $Compartment1 :: $Compartment2 :: $($PointsMap."$Char")"
            $RuckSackPriority += $PointsMap."$Char"
        }
    }
    $TotalPriorities += $RuckSackPriority
}
Write-Host "Total score: $TotalPriorities "