#Input
$UnformattedCalorieList = Get-Content 'Day1-Input.txt' -Raw

Write-Host "🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌"
Write-Host "Elf Calculator v22-Final-UseThisOne" -ForegroundColor Green
Write-Host "🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌🦌" 
Write-Host "🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄"
Write-Host "Splitting the unformatted string into each elf"
$FormattedCalorieList = $UnformattedCalorieList -split '\n\n'
Write-Host "🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄🎄"
Write-Host "🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁"
Write-Host "Calculating total calories for each elf"
#$ElfCalories = @{}
[Collections.Generic.Dictionary[int, int]] $ElfCalories = @{}
$HighestElf = @{"Elf" = 0; "Calories" = 0}

[int]$ElfCount = 1
ForEach ($Elf in $FormattedCalorieList){
    $Calories = 0
    $elf -split [Environment]::NewLine | ForEach-Object {$Calories += [int]$_}
    $ElfCalories.Add($ElfCount,$Calories)
    Write-Host "Elf $($ElfCount) has $($ElfCalories[$ElfCount]) calories"
    If ($HighestElf['Calories'] -lt $Calories)
    {
        $HighestElf.Calories = [int]$Calories
        $HighestElf.Elf = $ElfCount
    }
    $ElfCount++
}
Write-Host "🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁🎁"
Write-Host "🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅"
Write-Host "Determining who has the most calories"
Write-Host "Its elf $($HighestElf.Elf), with $($HighestElf.Calories) calories. Good work buddy."
Write-Host "🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅"
Write-Host "🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅"
Write-Host "Determining the top three elves count"
Write-Host "The top three elves have a total of: $(($ElfCalories.Values | Sort-Object -Descending -top 3 | Measure-Object -sum).Sum))"
Write-Host "🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅🎅"