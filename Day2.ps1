$InputFile = "Day2-Input.csv"
$Games = Get-Content $InputFile | ConvertFrom-Csv

$OpponentMap = @{
    'A' = 'Rock'
    'B' = 'Paper'
    'C' = 'Scissors'
}

$StrategyMap = @{
    'X' = 'Rock'
    'Y' = 'Paper'
    'Z' = 'Scissors'
}

$PointMap = @{
    'Paper' = 2
    'Rock' = 1
    'Scissors' = 3
}
$TotalPoints = 0
ForEach($Play in $Games){
    $Outcome = $null
    $RoundPoints = 0
    $Opponent = $OpponentMap."$($Play.opponent)"
    $Strategy = $StrategyMap."$($Play.Strategy)"
    switch ($Opponent) {
        "Rock" 
        { 
            Switch ($Strategy) {
                "Rock" {$Outcome = "Draw"}
                "Paper" {$Outcome = "Win"}
                "Scissors" {$Outcome = "Lose"}
            }
        }
        "Paper"
        {
            Switch ($Strategy) {
                "Rock" {$Outcome = "Lose"}
                "Paper" {$Outcome = "Draw"}
                "Scissors" {$Outcome = "Win"}
            }
        }
        "Scissors"
        {
            Switch ($Strategy) {
                "Rock" {$Outcome = "Win"}
                "Paper" {$Outcome = "Lose"}
                "Scissors" {$Outcome = "Draw"}
            }
        }
    }
    $RoundPoints += $PointMap."$($Strategy)"
    switch ($Outcome) {
        "Win" {$RoundPoints += 6}
        "Draw" {$RoundPoints += 3}
    }
    Write-Host "$Outcome :: $Opponent vs $Strategy :: Total Points $RoundPoints"
    $TotalPoints += $RoundPoints
}
Write-Host "🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️"
Write-Host "Total Points = $TotalPoints"